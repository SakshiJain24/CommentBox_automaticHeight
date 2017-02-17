//
//  ViewController.m
//  CommentBox
//
//  Created by Sakshi Jain on 14/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

#import "ViewController.h"
#import "ViewDemo.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = false;
    self.title = @"TableView Example";
    
    self.tableView = [[CustomTableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsSelection = YES;
    self.tableView.userInteractionEnabled = true;
    
    
    if([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TextViewDidBegin)
                                                 name:@"TextViewDidBegin"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TextViewEnd)
                                                 name:@"TextViewEnd"
                                               object:nil];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTouchView)];
    [self.view addGestureRecognizer:recognizer];
}


-(void)viewDidAppear:(BOOL)animated
{
    [self.tableView becomeFirstResponder];
}

-(void)TextViewDidBegin
{
    self.tableView.allowsSelection = NO;
}

-(void)TextViewEnd
{
    self.tableView.allowsSelection = YES;
}

// Dissmiss the keyboard on tableView touches by making
// the view the first responder
- (void)didTouchView
{
    [self.tableView becomeFirstResponder];
    [self performSelector:@selector(TextViewEnd) withObject:nil afterDelay:0.5];
}


#pragma mark Table View Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *commentCellIdentifier = @"noCommentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:commentCellIdentifier];
    
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"Be the first person to comment  %lu", indexPath.row]];
    [cell.textLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [cell.textLabel setUserInteractionEnabled:true];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callNextView)];
    [cell.contentView addGestureRecognizer:recognizer];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewDemo *viewDemo_VC = [[ViewDemo alloc] init];
    [self.navigationController pushViewController:viewDemo_VC animated:YES];
}

-(void)callNextView
{
    ViewDemo *viewDemo_VC = [[ViewDemo alloc] init];
    [self.navigationController pushViewController:viewDemo_VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
