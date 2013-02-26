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

    NSLocale * locale = [NSLocale currentLocale];

    [self.languageSelector removeAllItems];
    [self.languageSelector addItemsWithTitles: [locale localizedLanguageNames]];

    NSString * selectedLanguage = [[SUBPreferences sharedInstance] subtitlesLanguage];
    [self.languageSelector selectItemWithTitle: [locale displayNameForKey: NSLocaleIdentifier value: selectedLanguage]];
}

- (IBAction)languageDidChange: (id)sender
{
    NSString * selectedLanguageISOCode = [[NSLocale currentLocale] isoLanguageCodeForName: self.languageSelector.selectedItem.title];
    [[SUBPreferences sharedInstance] setSubtitlesLanguage: selectedLanguageISOCode];
}

- (IBAction)renameSubtitlesCheckboxClicked: (id)sender
{
    [[SUBPreferences sharedInstance] setShouldRenameSubtitles: (self.renameSubtitlesCheckbox.state == NSOnState)];
}

@end
