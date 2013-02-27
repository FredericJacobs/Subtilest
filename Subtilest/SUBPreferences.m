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

+ (void)registerDefaults
{
    NSDictionary *defaults = @{
        kSubtitlesLanguageKey: @"eng",
        kRenameSubtitlesKey: @YES
    };
    
    [[NSUserDefaults standardUserDefaults] registerDefaults: defaults];
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
    return [self.userDefaults stringForKey: kSubtitlesLanguageKey];
    
    // TODO: Use [NSLocale preferredLanguages][0] (need to map ISO 639-1 to ISO 639-2).
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
