//
//  CustomView.m
//  CommentBox
//
//  Created by Sakshi Jain on 14/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

#import "CustomView.h"
#import "KeyboardBar.h"

@interface CustomView()

// Override inputAccessoryView to readWrite
@property (nonatomic, readwrite, retain) UIView *inputAccessoryView;
    
@end

@implementation CustomView

// Override canBecomeFirstResponder
// to allow this view to be a responder
- (bool) canBecomeFirstResponder {
    return true;
}

// Override inputAccessoryView to use
// an instance of KeyboardBar
- (UIView *)inputAccessoryView {
    if(!_inputAccessoryView) {
        _inputAccessoryView = [[KeyboardBar alloc] initWithTag:(int)self.tag];
    }
    return _inputAccessoryView;
}

@end
