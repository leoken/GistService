//
//  GistServiceAppDelegate.h
//  GistService
//
//  Created by Andy Matuschak on 7/23/09.
//  Copyright 2009 Andy Matuschak. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GistServiceAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
