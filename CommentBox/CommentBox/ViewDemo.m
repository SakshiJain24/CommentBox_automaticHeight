//
//  ViewDemo.m
//  CommentBox
//
//  Created by Sakshi Jain on 14/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

#import "ViewDemo.h"
#import "CustomView.h"

#define IS_IPHONE_6 [ [ UIScreen mainScreen ] bounds ].size.width > 320

@interface ViewDemo ()
{
    
}

@property (strong, nonatomic) CustomView *view;

@end

@implementation ViewDemo

- (void)loadView {
    self.title = @"View Example";
    
    self.view = [[CustomView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view becomeFirstResponder];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTouchView)];
    [self.view addGestureRecognizer:recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTouchView {
    [self.view becomeFirstResponder];
}

@end
