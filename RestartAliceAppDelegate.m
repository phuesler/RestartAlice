//
//  RestartAliceAppDelegate.m
//  RestartAlice
//
//  Created by phuesler on 07.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import "RestartAliceAppDelegate.h"
#import "PreferenceController.h"

@implementation RestartAliceAppDelegate

@synthesize sbMenu, restartItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  sbItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
  // retain the the item, otherwise it will not show up in the status bar
  [sbItem retain];
	[sbItem setToolTip: @"RestartAlice"];
	[sbItem setHighlightMode:YES];
	[sbItem setEnabled:YES];
	[sbItem setMenu:sbMenu];
	[sbMenu setAutoenablesItems:false];
  NSBundle *bundle = [NSBundle mainBundle];
  statusImageDefault = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"status_icon" ofType: @"png"]];
  statusImageConnecting = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"status_icon_red" ofType: @"png"]];
	[sbItem setImage: statusImageDefault];
	[sbItem setAlternateImage: statusImageDefault];
  
  preferenceController = [[PreferenceController alloc] init];
}

- (IBAction) restart: (id) sender {
  restarter = [Restarter restartConnection: [preferenceController getRouterURL] 
                         username: [preferenceController getUsername]
                         password:[preferenceController getPassword]
                         delegate:self];
  
  [restartItem setEnabled:NO];
  [sbItem setImage: statusImageConnecting];
	[sbItem setAlternateImage: statusImageConnecting];
}

-(IBAction) showPreferences: (id) sender{
  if(!preferenceController){
    preferenceController = [[PreferenceController alloc] init];
  }
  [NSApp activateIgnoringOtherApps: YES];
  [preferenceController showWindow:self];
}

-(void) enableRestartItem{
  [restartItem setEnabled:YES];
  [sbItem setImage: statusImageDefault];
	[sbItem setAlternateImage: statusImageDefault];
}

-(void) aliceDSLRestartSuccessfull{
  [self enableRestartItem];
}

-(void) aliceDSLRestartFailedWithError:(NSError *) error{
  [NSApp presentError:error];
  [self enableRestartItem];
}

- (void) dealloc {
  [restarter release];
  [preferenceController release];
  [sbMenu release];
  [sbItem release];
  [restartItem release];
  [statusImageConnecting release];
  [statusImageDefault release];
  [super dealloc];
}


@end
