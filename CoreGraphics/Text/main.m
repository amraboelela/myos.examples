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

#include <stdlib.h>
#include <stdio.h>
#include <X11/Xlib.h>
#include <CoreGraphics/CGContext.h>
#import <Foundation/Foundation.h>

extern CGContextRef opal_XWindowContextCreate(Display *d, Window w);
extern void opal_XWindowContexSetSize(CGContextRef ctx, CGSize s);

void draw(CGContextRef ctx, CGRect r);

int main(int argc, char **argv)
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  int ret;
  CGRect cr;
  CGContextRef ctx;
  XSetWindowAttributes wa;
  XEvent e;
  Display *d;
  Window win;

  d = XOpenDisplay(NULL);
  if (!d)
    {
      fprintf(stderr,"Cannot open display: %s\n", XDisplayName(NULL));
      exit(EXIT_FAILURE);
    }
  printf("Opened display %s\n", DisplayString(d));

  cr = CGRectMake(0,0,640,480);
  wa.background_pixel = WhitePixel(d, DefaultScreen(d));
  wa.event_mask = ExposureMask | ButtonReleaseMask;

  /* Create a window */
  win = XCreateWindow(d, /* Display */
        DefaultRootWindow(d), /* Parent */
        cr.origin.x, cr.origin.y, /* x, y */
        cr.size.width, cr.size.height, /* width, height */
        0, /* border_width */
        CopyFromParent, /* depth */
        InputOutput, /* class */
        CopyFromParent, /* visual */
        CWBackPixel | CWEventMask, /* valuemask */
        &wa); /* attributes */
  printf("XCreateWindow returned: %lx\n", win);
  XSelectInput(d, win, ExposureMask | StructureNotifyMask | ButtonReleaseMask );
  /* Map the window */
  ret = XMapRaised(d, win);
  printf("XMapRaised returned: %x\n", ret);

  /* Create a CGContext */
  ctx = opal_XWindowContextCreate(d, win);
  if (!ctx) {
    fprintf(stderr,"Cannot create context\n");
    exit(EXIT_FAILURE);
  }
  printf("Created context\n");

  while(1)
  {
    NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
    XNextEvent(d,&e);
    switch(e.type)
    {
      case Expose:
       /*  Dispose multiple events*/
        while (XCheckTypedEvent(d, Expose, &e));

       /* Draw window contents */
        if(e.xexpose.count == 0) {
          CGContextSaveGState(ctx);
          XClearWindow(d, win);
          draw(ctx, cr);
          CGContextRestoreGState(ctx);
        }
        break;/*
      case ConfigureNotify:
        {
          if (cr.size.width != e.xconfigure.width || cr.size.height != e.xconfigure.height)
          {
            cr.size.width = e.xconfigure.width;
            cr.size.height = e.xconfigure.height;
            NSLog(@"New rect: %f x %f", (float)cr.size.width, (float)cr.size.height);
            opal_XWindowContexSetSize(ctx, cr.size);
          }
        }
        break;
      case ButtonRelease:
        Finish program
        CGContextRelease(ctx);
        XCloseDisplay(d);
        exit(EXIT_SUCCESS);
        break;*/
    }
    [pool2 release];
  }
  [pool release];
  return EXIT_SUCCESS;
}

