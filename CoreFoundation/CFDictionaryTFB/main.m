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

#import <CoreGraphics/StandardGlyphNames.h>

extern const char * const StandardGlyphNames[258];
extern const char * const StandardGlyphNamesKeys[258];

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool *pool;
    pool = [NSAutoreleasePool new];
    
    NSLog(@"test: %s", StandardGlyphNames[0]);
    
    NSDictionary *myColors;
    
    NSArray *keys = [NSArray arrayWithObjects:@"key1", @"key2", @"key3", nil];
    
    NSArray *objects = [NSArray arrayWithObjects:@"How", @"are", @"you", nil];
    
    myColors = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    CFDictionaryRef cfDict = myColors;
    CFStringRef value = CFDictionaryGetValue(cfDict, CFSTR("key1"));
    NSLog(@"value: %@", value);
    
    CFMutableDictionaryRef dict = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(dict, CFSTR("hey"), CFSTR("Ahmed"));
    CFDictionarySetValue(dict, CFSTR("hey1"), CFSTR("Ahmed1"));
    CFDictionarySetValue(dict, CFSTR("hey2"), CFSTR("Ahmed2"));
    
    
    NSLog(@"%@", (id) CFDictionaryGetValue(dict, (const void*) @"hey2"));
    NSLog(@"%@", CFDictionaryGetCount(dict));
    
    NSMutableDictionary* nsDict = dict;
    
    for (id key in nsDict) {
        NSLog(@"%@", key);
    }
    
    NSLog(@"here");
    
    return 0;
}
