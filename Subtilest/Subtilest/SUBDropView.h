//
//  SFDropView.h
//  SubFetch
//
//  Created by Romain Ruetschi on 17.02.13.
//  Copyright (c) 2013 Romain Ruetschi. All rights reserved.
//
// Adapted from a snippet by Mark Douma, found on http://stackoverflow.com/a/7408707/63301

#import <Cocoa/Cocoa.h>

@interface SUBDropView : NSView
{
    BOOL isHighlighted;
}

@property (assign, setter = setHighlighted:) BOOL isHighlighted;

@end
