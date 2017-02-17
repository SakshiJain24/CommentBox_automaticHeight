//
//  CustomTableView.m
//
//  CommentBox
//
//  Created by Sakshi Jain on 14/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

#import "CustomTableView.h"
#import "KeyboardBar.h"

@interface CustomTableView()

// Override inputAccessoryView to readWrite
@property (nonatomic, readwrite, strong) UIView *inputAccessoryView;

@end

@implementation CustomTableView

// Override canBecomeFirstResponder
// to allow this view to be a responder
- (BOOL) canBecomeFirstResponder {
    return true;
}

// Override inputAccessoryView to use
// an instance of KeyboardBar
- (UIView *)inputAccessoryView
{
    if(!_inputAccessoryView) {
        _inputAccessoryView = [[KeyboardBar alloc] initWithTag:(int)self.tag];
    }
    return _inputAccessoryView;
}

@end
