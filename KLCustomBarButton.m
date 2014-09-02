//
//  KLCustomBarButton.m
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import "KLCustomBarButton.h"

@implementation KLCustomBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, self.bounds);
    
}

@end
