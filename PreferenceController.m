//
//  PreferenceController.m
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import "PreferenceController.h"
#import "SDKeychain.h"

@implementation PreferenceController
@synthesize passwordField, routerURLField;

+ (void) initialize {
  NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
  [defaultValues setObject:@"http://192.168.1.1" forKey:@"RouterURL"];
  [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
  NSLog(@"registered default valies");
}

- (id)init{
  if(![super initWithWindowNibName:@"Preferences"]){
    return nil;
  }
     return self;
}

- (NSString *) routerURL{
  return [[NSUserDefaults standardUserDefaults] stringForKey:@"RouterURL"];
}

     
- (void) windowDidLoad{
  NSLog(@"Nib file is loaded");
}

-(NSString *) getPassword {
  	return [SDKeychain securePasswordForIdentifier: @"admin"];
}

-(IBAction) changePassword: (id) sender {
  NSLog(@"change password, written to keychain %@", [passwordField stringValue]);
  [SDKeychain setSecurePassword:[passwordField stringValue] forIdentifier: @"admin"];
}

-(IBAction) changeRouterURL: (id) sender {
  NSLog(@"change router url");
  [[NSUserDefaults standardUserDefaults] setObject:[routerURLField stringValue] forKey: @"RouterURL"];
}
@end
