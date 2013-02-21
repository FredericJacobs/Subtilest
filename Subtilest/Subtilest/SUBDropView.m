//
//  SFDropView.m
//  SubFetch
//
//  Created by Romain Ruetschi on 17.02.13.
//  Copyright (c) 2013 Mark Douma, Romain Ruetschi. All rights reserved.
//
// Adapted from a snippet by Mark Douma, found on http://stackoverflow.com/a/7408707/63301

#import "SUBDropView.h"

@implementation SUBDropView

@dynamic isHighlighted;

- (void)awakeFromNib
{
    [self registerForDraggedTypes: @[NSFilenamesPboardType]];
}

- (NSDragOperation)draggingEntered: (id<NSDraggingInfo>)sender
{
    [self setHighlighted: YES];
    return NSDragOperationEvery;
}

- (void)draggingExited: (id<NSDraggingInfo>)sender
{
    [self setHighlighted: NO];
}


- (BOOL)prepareForDragOperation: (id<NSDraggingInfo>)sender
{
    return YES;
}

- (BOOL)performDragOperation: (id<NSDraggingInfo>)sender
{
    NSPasteboard *pboard = sender.draggingPasteboard;
    if( [pboard.types containsObject: NSURLPboardType] ) {
        if( self.callback ) {
            self.callback( [NSURL URLFromPasteboard: pboard] );
        }
    }
    [self setHighlighted: NO];
    return YES;
}

- (BOOL)isHighlighted
{
    return isHighlighted;
}

- (void)setHighlighted: (BOOL)value
{
    isHighlighted = value;
    [self setNeedsDisplay: YES];
}

- (void)drawRect: (NSRect)frame
{
    [super drawRect: frame];
    if(self.isHighlighted) {
        NSBezierPath.defaultLineWidth = 6.0;
        [NSColor.keyboardFocusIndicatorColor set];
        [NSBezierPath strokeRect:frame];
    }
}


@end
