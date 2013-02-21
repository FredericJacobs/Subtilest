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
    [self.languageSelector addItemsWithTitles: [locale localizedLanguagesNames]];
    [self.languageSelector setTarget: self];
    [self.languageSelector setAction: @selector(languageDidChange:)];

    NSString * selectedLanguage = [[SUBPreferences sharedInstance] subtitlesLanguage];
    [self.languageSelector selectItemWithTitle: [locale displayNameForKey: NSLocaleIdentifier value: selectedLanguage]];
}

- (void)languageDidChange: (id)sender
{
    NSString * selectedLanguageISOCode = [[NSLocale currentLocale] isoLanguageCodeForName: self.languageSelector.selectedItem.title];
    [[SUBPreferences sharedInstance] setSubtitlesLanguage: selectedLanguageISOCode];
}

@end
