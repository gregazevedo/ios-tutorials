//
//  ViewController.m
//  SimpleButtonDelegate
//
//  Created by Greg Azevedo on 3/13/14.
//  Copyright (c) 2014 dolodev LLC. All rights reserved.
//

#import "ViewController.h"
#import "TapView.h"

@interface ViewController ()  <TapButtonDelegate>

@property (nonatomic) TapView *tapView;
@property (nonatomic) UIView *movingView1;
@property (nonatomic) UIView *movingView2;
@property (nonatomic) UIView *movingView3;

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    
    self.movingView1 = [UIView new];
    self.movingView1.frame = CGRectMake(20, 300, 100, 100);
    self.movingView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.movingView1];
    
    self.movingView2 = [UIView new];
    self.movingView2.frame = CGRectMake(200, 300, 100, 100);
    self.movingView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.movingView2];
    
    self.tapView = [TapView new];
    self.tapView.frame = CGRectMake(20, 20, 300, 100);
    [self.view addSubview:self.tapView];
    self.tapView.delegate = self;
}

-(void)doSomethingWhenITapTheButton
{
    //TapView knows nothing about the ViewController's movingViews, but since the ViewController comforms to TapView's protocol, TapViewDelegate, a gesture handled in TapView can trigger a sequence of events in ViewController
    [UIView animateWithDuration:1 animations:^{
        self.movingView1.center = CGPointMake(self.movingView1.center.x, self.movingView1.center.y+50);
        self.movingView2.center = CGPointMake(self.movingView2.center.x, self.movingView2.center.y+50);
        self.movingView1.backgroundColor = [UIColor blueColor];
    }];
    
    self.movingView3 = [UIView new];
    self.movingView3.frame = CGRectMake(200, 300, 50, 50);
    self.movingView3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.movingView3];

}

-(void)undoWhateverTheDelegateDid
{
    [UIView animateWithDuration:1 animations:^{
        self.movingView1.center = CGPointMake(self.movingView1.center.x, self.movingView1.center.y-50);
        self.movingView2.center = CGPointMake(self.movingView2.center.x, self.movingView2.center.y-50);
    }];
    self.movingView3 = nil;
}

@end
