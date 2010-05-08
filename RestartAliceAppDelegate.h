//
//  RestartAliceAppDelegate.h
//  RestartAlice
//
//  Created by phuesler on 07.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Restarter.h"
@class PreferenceController;

#if (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_5)
@interface RestartAliceAppDelegate : NSObject {
#else
@interface RestartAliceAppDelegate : NSObject <NSApplicationDelegate> {
#endif
    NSStatusItem *sbItem;
    NSMenu *sbMenu;
    Restarter *restarter;
    NSMenuItem *restartItem;
    NSImage *statusImageDefault;
    NSImage *statusImageConnecting;
    PreferenceController * preferenceController;
}

@property (assign) IBOutlet NSMenu *sbMenu;
@property (assign) IBOutlet NSMenuItem *restartItem;

-(IBAction) restart: (id) sender;
-(IBAction) showPreferences: (id) sender;
-(void) aliceDSLRestartSuccessfull;
-(void) aliceDSLRestartFailedWithError:(NSError *) error;

@end
