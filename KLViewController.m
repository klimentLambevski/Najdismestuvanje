//
//  KLViewController.m
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import "KLViewController.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIDevice *device = [UIDevice currentDevice];
    
    device.batteryMonitoringEnabled = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryChanged:) name:UIDeviceBatteryLevelDidChangeNotification object:device];
}

- (void)batteryChanged:(NSNotification *)notification
{
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"State: %f", device.batteryLevel);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)share:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller addURL:[NSURL URLWithString:@"http://najdismestuvanje.mk"]];
        
        [controller setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful"
                                                            message:@"Content Shared"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
            [alert show];
        }];
        [controller setInitialText:@"Najdi Smestuvanje"];
        [self presentViewController:controller animated:YES completion:Nil];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Failed"
                                  message:@"Error"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)m withEvent:(UIEvent *)event
{
    if (m == UIEventSubtypeMotionShake)
    {
        [self showAlert];
    }
}

-(IBAction)showAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Shake sensor" message: @"Best sensor EU" delegate: nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alertView show];
}

@end
