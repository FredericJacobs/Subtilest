//
//  SUBPreferencesController.h
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SUBPreferencesController : NSWindowController

@property (weak) IBOutlet NSPopUpButton * languageSelector;
@property (weak) IBOutlet NSButton * renameSubtitlesCheckbox;

- (IBAction)languageDidChange: (id)sender;
- (IBAction)renameSubtitlesCheckboxClicked: (id)sender;

@end
