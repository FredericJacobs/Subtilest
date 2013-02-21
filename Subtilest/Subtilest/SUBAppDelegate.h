//
//  SUBAppDelegate.h
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2012 Frederic Jacobs. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XMLRPC/XMLRPC.h>
#import "SUBPreferencesController.h"

@interface SUBAppDelegate : NSObject <NSApplicationDelegate, XMLRPCConnectionDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) SUBPreferencesController *preferencesController;

- (IBAction)showPreferences:(id)sender;

@end
