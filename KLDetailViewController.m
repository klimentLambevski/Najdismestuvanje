//
//  KLDetailViewController.m
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import "KLDetailViewController.h"

@interface KLDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
@property (weak, nonatomic) IBOutlet UITextView *tvOpis;

@end

@implementation KLDetailViewController

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
    self.lblName.text = self.mesto.name;
    self.lblTip.text = self.mesto.tip;
    self.tvOpis.text = self.mesto.opis;
    
    [self saveToPList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveToPList
{
    listPath = [[self docsDir]stringByAppendingPathComponent:@"data.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:listPath]) {
        
        [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"] toPath:listPath error:nil];
    }
    
    array = [NSMutableArray arrayWithContentsOfFile:listPath];
    
    NSLog(@"Local: %@", array);
    
    NSString *storestr = self.lblName.text;
    
    [array addObject:storestr];
    
    [array writeToFile:listPath atomically:YES];
    
}

- (NSString *)docsDir
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
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
