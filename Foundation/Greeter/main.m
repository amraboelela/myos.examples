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

#include <stdio.h>
#include <Foundation/Foundation.h>

@interface Greeter:NSObject
{
    /* This is left empty on purpose:
     ** Normally instance variables would be declared here,
     ** but these are not used in our example.
     */
}

- (void)greet;

@end

@implementation Greeter

- (void)greet
{
    printf("Hello, World!\n");
}

@end

#include <stdlib.h>

int main(void)
{
    id myGreeter;
    myGreeter=[[Greeter alloc] init];
    
    [myGreeter greet];
    
    [myGreeter release];
    return EXIT_SUCCESS;
}
