/*
 Copyright © 2015 myOS Group.
 
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

#import "AppDelegate.h"
#import "ColorSpaceView.h"

@implementation AppDelegate

@synthesize window;

#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DLog();
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[[UIWindow alloc] initWithFrame:frame] autorelease];
    self.window.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];//[UIColor blueColor];
    float width = 300;
    float height = 300;
    float x = (frame.size.width - width) / 2.0;
    float y = (frame.size.height - height) / 2.0;
    ColorSpaceView *colorspace = [[[ColorSpaceView alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease];
    [window addSubview:colorspace];
    //DLog(@"colorspace: %@", colorspace);
    [window makeKeyAndVisible];

    return YES;
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}

@end

