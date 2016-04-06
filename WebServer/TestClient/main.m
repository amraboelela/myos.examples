/** 
   Copyright (C) 2008 Free Software Foundation, Inc.
   
   Written by:  Richard Frith-Macdonald <rfm@gnu.org>
   Date:	September 2008
   Modified by: Amr Aboelela <amraboelela@gmail.com>
   Date:    April 2016
 
   This file is part of the WebServices package.

   This is free software; you can redistribute it and/or
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

   $Date: 2007-09-14 13:54:55 +0100 (Fri, 14 Sep 2007) $ $Revision: 25485 $
   */ 

#import	<Foundation/Foundation.h>
//#import	"GWSPrivate.h"
//#import	"WSSUsernameToken.h"

/*
@interface	SimpleDelegate : NSObject
{
  WSSUsernameToken	*_token;
}
- (void) setToken: (WSSUsernameToken*)token;
@end
@implementation	SimpleDelegate
- (void) dealloc
{
  [_token release];
  [super dealloc];
}

- (void) setToken: (WSSUsernameToken*)token
{
  if (_token != token)
    {
      [_token release];
      _token = [token retain];
    }
}

- (GWSElement*) webService: (GWSService*)service
		willEncode: (GWSElement*)element
{
  if (_token != nil)
    {
      if (element == nil || [[element name] isEqualToString: @"Header"])
	{
	  element = [_token addToHeader: element];
	}
    }
  return element;
}
@end
*/

int main()
{
 CREATE_AUTORELEASE_POOL(pool);
 
 RELEASE(pool);
 return 0;
}
