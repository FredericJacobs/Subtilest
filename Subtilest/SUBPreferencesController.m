//
//  SUBPreferencesController.m
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBPreferencesController.h"
#import "NSLocale+SUBLanguagesNames.h"
#import "SUBPreferences.h"


@implementation SUBPreferencesController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {}

    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    SUBPreferences *prefs = [SUBPreferences sharedInstance];
    
    [self.languageSelector removeAllItems];
    [self.languageSelector addItemsWithTitles: [[NSLocale ISO6392LanguageNames] sortedArrayUsingSelector: @selector(localizedCaseInsensitiveCompare:)]];

    NSString *selectedLanguage = [prefs subtitlesLanguage];
    [self.languageSelector selectItemWithTitle: [NSLocale ISO6392LanguageMap][selectedLanguage]];
    
    self.renameSubtitlesCheckbox.state = [prefs shouldRenameSubtitles] ? NSOnState : NSOffState;
}

- (IBAction)languageDidChange: (id)sender
{
    NSString * selectedLanguageISOCode = [[NSLocale ISO6392LanguageMap] allKeysForObject: self.languageSelector.selectedItem.title][0];
    [[SUBPreferences sharedInstance] setSubtitlesLanguage: selectedLanguageISOCode];
}

- (IBAction)renameSubtitlesCheckboxClicked: (id)sender
{
    [[SUBPreferences sharedInstance] setShouldRenameSubtitles: (self.renameSubtitlesCheckbox.state == NSOnState)];
}

@end
