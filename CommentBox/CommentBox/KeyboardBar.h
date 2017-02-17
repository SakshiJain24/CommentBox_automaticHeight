//
//  KeyboardBar.h
//
//  CommentBox
//
//  Created by Sakshi Jain on 14/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardBar : UIView <UITextViewDelegate>
{
    UIButton *postBtn;
}

@property (strong, nonatomic) UITextView *DetailTextView;

- (id)initWithTag:(int)tag;

@end