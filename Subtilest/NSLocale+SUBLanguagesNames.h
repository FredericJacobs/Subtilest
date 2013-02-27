//
//  NSLocale+SUBLanguagesNames.h
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (SUBLocalizedLanguagesNames)

+ (NSDictionary *)ISO6392LanguageMap;
+ (NSArray *)ISO6392LanguageCodes;
+ (NSArray *)ISO6392LanguageNames;

@end
