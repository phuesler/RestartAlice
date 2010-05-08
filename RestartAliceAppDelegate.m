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
	[sbItem setToolTip: @"RestartAlice"];
	[sbItem setHighlightMode:YES];
	[sbItem setEnabled:YES];
	[sbItem setMenu:sbMenu];
	[sbMenu setAutoenablesItems:false];
  NSBundle *bundle = [NSBundle mainBundle];
  NSImage * statusImage = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"status_icon" ofType: @"png"]];	
	[sbItem setImage: statusImage];
	[sbItem setAlternateImage: statusImage];
  [statusImage release];
}

- (IBAction) restart: (id) sender {
  restarter = [Restarter restartConnection: @"http://192.168.1.1" password:@"Q8sps0oBch" delegate:self];
}

-(void) aliceDSLRestartSuccessfull{
  NSLog(@"%@",@"Restarted successfully");
}

-(void) aliceDSLRestartFailed{
  NSLog(@"%@",@"Restart failed");
}

- (void) dealloc {
  [restarter release];
  [window release];
  [sbMenu release];
  [sbItem release];
  [super dealloc];
}


@end
