/** 
   Copyright (C) 2005 Free Software Foundation, Inc.
   
   Written by:  Richard Frith-Macdonald <rfm@gnu.org>
   Date:	September 2005
   Modified by: Amr Aboelela <amraboelela@gmail.com>
   Date:    March 2016
 
   This file is part of the SQLClient Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 3 of the License, or (at your option) any later version.
   
   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.
   
   You should have received a copy of the GNU Lesser General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.

   $Date: 2014-03-19 01:07:41 -0700 (Wed, 19 Mar 2014) $ $Revision: 37755 $
   */ 

#import	<Foundation/Foundation-private.h>
#import	<WebServer/WebServer.h>

@interface	Handler: NSObject

- (BOOL) processRequest: (WebServerRequest*)request
               response: (WebServerResponse*)response
		    for: (WebServer*)http;

@end

@implementation	Handler

- (BOOL) processRequest: (WebServerRequest*)request
               response: (WebServerResponse*)response
		    for: (WebServer*)http
{
    NSString		*s;
    
    s = [[NSString alloc] initWithData: [request rawMimeData]
                              encoding: NSISOLatin1StringEncoding];
    NSLog(@"Got request -\n%@\n", s);
    [response setContent: s type: @"text/plain" name: nil];
    RELEASE(s);
    
    return YES;
}

@end

int main()
{
    CREATE_AUTORELEASE_POOL(pool);
    WebServer		*server;
    Handler		*handler;
    NSUserDefaults	*defs;
    
    defs = [NSUserDefaults standardUserDefaults];
    [defs registerDefaults:
     [NSDictionary dictionaryWithObjectsAndKeys:
      @"8080", @"Port",
      [NSNumber numberWithBool:YES], @"Debug",
      nil]
     ];
    
    NSCAssert(NO == [WebServer matchIP:@"1.2.3.4" to:@"4.5.6.7"], @"Match1");
    NSCAssert([WebServer matchIP:@"1.2.3.4" to:@"1.2.3.4"], @"Match2");
    NSCAssert([WebServer matchIP:@"1.2.3.4" to:@"1.2.3.0/24"], @"Match3");
    NSCAssert([WebServer matchIP:@"1.2.4.4" to:@"1.2.3.0/16"], @"Match4");
    
    server = [WebServer new];
    
    handler = [Handler new];
    [server setDelegate:handler];
    [server setPort:[defs stringForKey:@"Port"] secure:nil];
    [server setVerbose:[defs boolForKey:@"Debug"]];
    [[NSRunLoop currentRunLoop] run];
    [handler release];
    
    RELEASE(pool);
    return 0;
}

