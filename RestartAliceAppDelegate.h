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


@interface RestartAliceAppDelegate : NSObject <NSApplicationDelegate> {
    
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
