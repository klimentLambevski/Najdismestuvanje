//
//  KLMapViewController.m
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import "KLMapViewController.h"
#import "KLMesto.h"

@interface KLMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation KLMapViewController

@synthesize responseData;
- (IBAction)LocateMe:(id)sender {
    self.mapView.showsUserLocation = YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MKCoordinateRegion reg;
    reg.center.latitude = 41.123098;
    reg.center.longitude = 20.801648;
    reg.span.latitudeDelta = 0.15f;
    reg.span.longitudeDelta = 0.15f;
    [self.mapView setRegion:reg animated:TRUE];
    
    
    NSString *url=   [NSString stringWithFormat:@"http://najdismestuvanje.x10.mx/ajaxServises/getProfileJson.php"];
    
    responseData = [NSMutableData data];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:url]];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    self.listPlaces = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    for (NSDictionary* item in res) {
        KLMesto* mesto = [[KLMesto alloc] initWithDictionary:item];
        [self.listPlaces addObject:mesto];
        [self.mapView addAnnotation:mesto];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
