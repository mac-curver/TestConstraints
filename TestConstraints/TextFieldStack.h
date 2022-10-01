//
//  MyCustomView.h
//  TestConstraints
//
//  Created by LegoEsprit on 27.09.22.
//  Copyright © 2022 LegoEsprit. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldStack : NSView {
    NSArray *lineSpacers;
}

- (NSRect) myFrameRect;
- (void) addHorizontalLines:(NSArray *) list;


@end

NS_ASSUME_NONNULL_END
