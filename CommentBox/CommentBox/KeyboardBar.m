//
//  KeyboardBar.m
//
//  CommentBox
//
//  Created by Sakshi Jain on 14/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

#import "KeyboardBar.h"
#import "AppDelegate.h"

#define IS_IPHONE_6 [ [ UIScreen mainScreen ] bounds ].size.width > 320

@implementation KeyboardBar

- (id)initWithTag:(int)tag   {
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGRect frame = CGRectMake(0,0, CGRectGetWidth(screen), 45);
    self = [self initWithFrame:frame WithTag:tag];
    return self;
}

- (id)initWithFrame:(CGRect)frame WithTag:(int)tag {
    
    self = [super initWithFrame:frame];
    if(self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.75f alpha:1.0f];
        
        _DetailTextView = [[UITextView alloc]initWithFrame:CGRectMake(7, 5, IS_IPHONE_6? [ [ UIScreen mainScreen ] bounds ].size.width - 80:240, 35)];
        _DetailTextView.tag = tag;
        _DetailTextView.backgroundColor = [UIColor whiteColor];
        _DetailTextView.userInteractionEnabled = YES;
        _DetailTextView.showsVerticalScrollIndicator = NO;
        _DetailTextView.editable = YES;
        _DetailTextView.text = @"Add a comment";
        _DetailTextView.textAlignment = NSTextAlignmentJustified;
        _DetailTextView.textColor = [UIColor grayColor];
        [_DetailTextView setFont:[UIFont systemFontOfSize:15.0f]];
        [_DetailTextView setDelegate:self];
        [_DetailTextView setTintColor:[UIColor grayColor]];
        [_DetailTextView setKeyboardType:UIKeyboardTypeTwitter];
        [[_DetailTextView layer] setCornerRadius:5.0f];
        [self addSubview:_DetailTextView];
      
        
        postBtn = [[UIButton alloc] initWithFrame:CGRectMake(IS_IPHONE_6? [ [ UIScreen mainScreen ] bounds ].size.width - 65:255, 5, 60, 35)];
        [[postBtn layer] setCornerRadius:5.0f];
        [postBtn setBackgroundColor:[UIColor redColor]];
        [postBtn setTitle:@"Post" forState:UIControlStateNormal];
        [postBtn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [postBtn addTarget:self action:@selector(postBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:postBtn];
    }
    return self;
}

-(void)postBtnClicked
{
    if (_DetailTextView.text.length!=0)
    {
        [_DetailTextView resignFirstResponder];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TextViewEnd" object:nil];

        NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
        if(![_DetailTextView.text isEqualToString:@"Add a comment"]  && [[_DetailTextView.text stringByTrimmingCharactersInSet: set] length] != 0)
        {
            [self PostBtnClick:_DetailTextView.text];
        }
        else
        {
            [_DetailTextView setText:@"Add a comment"];
        }
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TextViewEnd" object:nil];
        [_DetailTextView resignFirstResponder];
    }
}

-(void)PostBtnClick:(NSString *)text
{
    // Go For Button Action
}


#pragma mark Text View Delegate  Methods
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return true;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"Add a comment"])
        [textView setText:@""];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TextViewDidBegin" object:nil];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length == 0)
        [textView setText:@"Add a comment"];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSInteger newTextLength = [textView.text length] - range.length + [text length];
    
    if (newTextLength > 200)
        return NO;
    
    return YES;
}

@end