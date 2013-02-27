//
//  NSLocale+SUBLanguagesNames.m
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "NSLocale+SUBLanguagesNames.h"

@implementation NSLocale (SUBLocalizedLanguagesNames)

+ (NSDictionary *)ISO6392LanguageMap
{
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"iso639-2" ofType: @"json"]];
    NSDictionary *map = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &error];
    
    // TODO: Check for errors
    // TODO: Cache result
    
    return map;
}

+ (NSArray *)ISO6392LanguageCodes
{
    return [[NSLocale ISO6392LanguageMap] allKeys];
}

+ (NSArray *)ISO6392LanguageNames
{
    return [[NSLocale ISO6392LanguageMap] allValues];

}

@end
