//
//  PreferenceController.h
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const RALUsernameKey;
extern NSString * const RALRouterURLKey;

@interface PreferenceController : NSWindowController {
  NSSecureTextField *passwordField;
  NSTextField * routerURLField;
}

-(IBAction) changePassword: (id) sender;
-(IBAction) changeRouterURL: (id) sender;
-(NSString *) getPassword;
-(NSString *) getRouterURL;
-(NSString *) getUsername;

@property (assign) IBOutlet NSSecureTextField *passwordField;
@property (assign) IBOutlet NSTextField *routerURLField;

@end
