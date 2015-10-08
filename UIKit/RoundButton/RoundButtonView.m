/*
 Copyright © 2014 myOS Group.
 
 This application is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 Lesser General Public License for more details.
 
 Contributor(s):
 Amr Aboelela <amraboelela@gmail.com>
 */

#import "RoundButtonView.h"
#import <QuartzCore/QuartzCore.h>

@implementation RoundButtonView
 
@synthesize button;

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)theFrame
{
    self = [super initWithFrame:theFrame];
    if (self) {
	//return self;
        self.backgroundColor = [UIColor greenColor];

        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        self.button.frame = CGRectMake(50,50,150,70);
        self.button.backgroundColor = [UIColor whiteColor];
        self.button.layer.borderColor = [[UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:200.0/255.0 alpha:1.0] CGColor];
        self.button.layer.borderWidth = 1;
        self.button.layer.cornerRadius = 7;
        self.button.layer.masksToBounds = YES;
        self.button.titleLabel.font = [UIFont systemFontOfSize:20];

        [self.button setTitle:@"Toto" forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(unClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

- (void)dealloc
{
    [button release];
    [super dealloc];
}

#pragma mark - Actions

- (void)clickedButton:(id)sender
{
    DLog(@"sender: %@", sender);
    self.button.highlighted = YES;
    //[NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(unClickButton) userInfo:nil repeats:NO];
}

- (void)unClickButton:(id)sender
{
    //DLog(@"sender: %@", sender);
    self.button.highlighted = NO;
}

@end

