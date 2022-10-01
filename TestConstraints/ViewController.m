//
//  ViewController.m
//  TestConstraints
//
//  Created by LegoEsprit on 24.09.22.
//  Copyright © 2022 LegoEsprit. All rights reserved.
//

#import "TextFieldStack.h"
#import "ViewController.h"

@implementation ViewController



- (void)viewDidLoad {

    NSRect arbRect = _textFieldStack.bounds;
    
    for (int i = 0; i < 4; i++) {
        NSTextField *text = [[NSTextField alloc] initWithFrame:arbRect];
        text.stringValue = [NSString stringWithFormat:@"%d", i];
        [_textFieldStack addSubview:text];
    }
    [_textFieldStack addHorizontalLines:@[@false, @false, @true]];

    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}




@end
