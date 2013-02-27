//
//  NSLocale+SUBLanguagesNames.m
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBLanguages.h"

@implementation SUBLanguages

+ (NSDictionary *)languageMap
{
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"Languages" ofType: @"json"]];
    NSDictionary *map = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &error];
    
    // TODO: Check for errors
    // TODO: Cache result
    
    return map;
}

+ (NSArray *)languageCodes
{
    return [[SUBLanguages languageMap] allKeys];
}

+ (NSArray *)languageNames
{
    return [[SUBLanguages languageMap] allValues];

}

@end
