//
//  KLTableViewController.h
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray* listPlaces;
@property (nonatomic, strong) NSMutableData* responseData;

@end
