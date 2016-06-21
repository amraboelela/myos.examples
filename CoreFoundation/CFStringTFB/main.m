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

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool *pool;
    pool = [NSAutoreleasePool new];
    
    NSString *nsStr = @"Amr aboelela";
    CFIndex length = CFStringGetLength((CFStringRef)nsStr);
    
    NSLog(@"Cast from Foundation to Core Foundation");
    
    CFStringRef name = CFSTR("Helvetica");
    BOOL b = [name isEqualToString:@"Helvetica"];
    if (b) {
        NSLog(@"True");
    } else {
        NSLog(@"False");
    }
    NSLog(@"length(Amr aboelela) = %d\n", length);
    NSLog(@"Cast from Foundation to Core Foundation");
    char cStr[] = {'A','m','r',' ','a','b','o','e','l','e','l','a','\0'};
    //char strArr[] = {'a','m','r',' ','a','b','o','e','l','a','\0'};
    //char *cStr = "b";
    CFStringRef cfStr = CFStringCreateWithCString(NULL, cStr, kCFStringEncodingUTF8);
    NSString *nscfStr = (NSString *)cfStr;
    NSLog(@"length(Amr aboelela)array = %d\n", [nscfStr length]);
    NSLog(@"isEqualToString: %@\n", [nsStr isEqualToString:cfStr] ? @"YES" : @"NO");
    NSLog(@"CFStringCompare: %@\n", CFStringCompare(cfStr, nsStr, 0) == 0 ? @"YES" : @"NO");
    [pool release];    
    return 0;
}
