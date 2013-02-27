//
//  SUBPreferences.m
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBPreferences.h"

static NSString * const kSubtitlesLanguageKey = @"Subtitles Language";
static NSString * const kRenameSubtitlesKey = @"Rename Subtitles";

@implementation SUBPreferences

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    return self;
}

- (void)setSubtitlesLanguage: (NSString *)languageISOCode
{
    [self.userDefaults setObject: languageISOCode forKey: kSubtitlesLanguageKey];
    [self.userDefaults synchronize];
}

- (NSString *)subtitlesLanguage
{
    NSString * selectedLanguage = [self.userDefaults stringForKey: kSubtitlesLanguageKey];

    if( selectedLanguage ) {
        return selectedLanguage;
    }

    return [[NSLocale preferredLanguages] objectAtIndex: 0];
}

- (void)setShouldRenameSubtitles: (BOOL)value
{
    [self.userDefaults setBool: value forKey: kRenameSubtitlesKey];
    [self.userDefaults synchronize];
}

- (BOOL)shouldRenameSubtitles
{
    return [self.userDefaults boolForKey: kRenameSubtitlesKey];
}

@end
