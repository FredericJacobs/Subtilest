//
//  NSLocale+SUBLanguagesNames.m
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "NSLocale+SUBLanguagesNames.h"

@implementation NSLocale (SUBLocalizedLanguagesNames)

- (NSArray *)localizedLanguagesNames
{
    NSMutableArray * languagesTitles = [[NSMutableArray alloc] init];
    NSArray * isoLanguageCodes = [NSLocale ISOLanguageCodes];

    for( NSString * isoCode in isoLanguageCodes ) {
        if(isoCode != nil) {
            NSString * languageTitle = [self displayNameForKey: NSLocaleIdentifier value: isoCode];
            if( languageTitle != nil ) {
                [languagesTitles addObject: languageTitle];
            }
        }
    }

    // Return an immutable copy
    return [languagesTitles copy];
}

// FIXME: Ugly and slow, better make a dictionary which maps ISO codes to their display name
- (NSString *)isoLanguageCodeForName: (NSString *) displayName
{
    for( NSString * isoCode in [NSLocale ISOLanguageCodes] ) {
        if( [displayName isEqualToString: [self displayNameForKey: NSLocaleIdentifier value: isoCode]] ) {
            return isoCode;
        }
    }

    return nil;
}

@end
