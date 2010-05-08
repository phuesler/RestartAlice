//
//  RestartAliceAppDelegate.h
//  RestartAlice
//
//  Created by phuesler on 07.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Restarter.h"

#if (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_5)
  @interface RestartAliceAppDelegate : NSObject {
#else
  @interface RestartAliceAppDelegate : NSObject <NSApplicationDelegate> {
#endif
    
    NSWindow *window;
    NSStatusItem *sbItem;
    NSMenu *sbMenu;
    Restarter *restarter;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *sbMenu;

-(IBAction) restart: (id) sender;
-(void) aliceDSLRestartSuccessfull;
-(void) aliceDSLRestartFailed;    

@end
