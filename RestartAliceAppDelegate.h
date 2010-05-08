//
//  RestartAliceAppDelegate.h
//  RestartAlice
//
//  Created by phuesler on 07.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Restarter.h"

@interface RestartAliceAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSStatusItem *sbItem;
    NSMenu *sbMenu;
    NSImage *statusImage;
    Restarter *restarter;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *sbMenu;

-(IBAction) restart: (id) sender;

@end
