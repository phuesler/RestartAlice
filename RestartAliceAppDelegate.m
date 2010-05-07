//
//  RestartAliceAppDelegate.m
//  RestartAlice
//
//  Created by phuesler on 07.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import "RestartAliceAppDelegate.h"

@implementation RestartAliceAppDelegate

@synthesize window, sbMenu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  sbItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[sbItem retain];
	//[self setStatusIcon];
  [sbItem setTitle:@"Alice"];
	[sbItem setToolTip: @"Alice"];
	[sbItem setHighlightMode:YES];
	[sbItem setEnabled:YES];
	[sbItem setMenu:sbMenu];
	[sbMenu setAutoenablesItems:false];  
}

- (IBAction) restart: (id) sender {
  NSLog(@"%@", @"restart");
}


@end
