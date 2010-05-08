//
//  PreferenceController.h
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PreferenceController : NSWindowController {
  NSSecureTextField *passwordField;
  NSTextField * routerURLField;
}

-(IBAction) changePassword: (id) sender;
-(IBAction) changeRouterURL: (id) sender;
-(NSString *) getPassword;

@property (assign) IBOutlet NSSecureTextField *passwordField;
@property (assign) IBOutlet NSTextField *routerURLField;

@end
