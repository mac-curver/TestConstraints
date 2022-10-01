//
//  MyCustomView.m
//  TestConstraints
//
//  Created by LegoEsprit on 27.09.22.
//  Copyright © 2022 LegoEsprit. All rights reserved.
//

#import "TextFieldStack.h"

@implementation TextFieldStack

static const int VerticalSpacing = 4;
static const int HorizontalMargin = 0;


- (NSRect) myFrameRect {
    NSRect rect = self.bounds;
    rect.size.height -= (self.subviews.count-1) * VerticalSpacing;
    rect.size.height /= self.subviews.count;
    rect.origin.y = self.bounds.size.height-rect.size.height;
    rect.origin.x += HorizontalMargin;
    rect.size.width -= 2*HorizontalMargin;
    return rect;
}

- (instancetype) initWithFrame:(NSRect) frame {
    return [super initWithFrame:frame];
}

- (void) awakeFromNib {
}

- (void) addHorizontalLines:(NSArray *) list {
    lineSpacers = list;
}

- (void)drawRect:(NSRect)dirtyRect {
    NSRect rect = [self myFrameRect];

    CGFloat height = rect.size.height  + VerticalSpacing;
    for (int i = 0; i < self.subviews.count; i++) {
        NSView *view = [self.subviews objectAtIndex:i];
        view.frame = rect;
        rect.origin.y -= height;
    }

    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    //NSGraphicsContext *context = NSGraphicsContext.currentContext;
    //[context saveGraphicsState];

    for (int i = 0; i < lineSpacers.count; i++) {
        if ([lineSpacers[i] boolValue]) {
            NSBezierPath* clipPath = [NSBezierPath bezierPath];
            [clipPath setLineWidth:VerticalSpacing];
            CGFloat pos = (self.subviews.count-1 - i)*height-VerticalSpacing/2;
            [clipPath moveToPoint:NSMakePoint(0.0, pos)];
            [clipPath lineToPoint:NSMakePoint(self.bounds.size.width, pos)];
            
            [clipPath stroke];
        }
    }

    //[context restoreGraphicsState];
    
}

@end
