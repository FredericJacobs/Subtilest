//
//  SUBPreferences.m
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBPreferences.h"

static NSString * const kSubtitlesLanguageKey = @"Subtitles Language";

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

- (void)setSubtitlesLanguage: (NSString *)languageISOCode
{
    [[NSUserDefaults standardUserDefaults] setObject: languageISOCode forKey: kSubtitlesLanguageKey];
}

- (NSString *)subtitlesLanguage
{
    NSString * selectedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey: kSubtitlesLanguageKey];

    if( selectedLanguage ) {
        return selectedLanguage;
    }

    return [[NSLocale preferredLanguages] objectAtIndex: 0];
}

@end
