//
//  TapView.m
//  SimpleButtonDelegate
//
//  Created by Greg Azevedo on 3/13/14.
//  Copyright (c) 2014 dolodev LLC. All rights reserved.
//

#import "TapView.h"

@implementation TapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(delegateTheTap:)];
        [self addGestureRecognizer:self.tap1];
        self.tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(delegateTheTapBack:)];
        [self addGestureRecognizer:self.tap2];
        self.tap2.enabled = NO;
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}


-(void)delegateTheTap:(UITapGestureRecognizer *)tap
{
    NSLog(@"tapped");
    [self.delegate doSomethingWhenITapTheButton];
    self.tap1.enabled = NO;
    self.tap2.enabled = YES;
}

-(void)delegateTheTapBack:(UITapGestureRecognizer *)tap
{
    NSLog(@"tapped");
    [self.delegate undoWhateverTheDelegateDid];
    self.tap1.enabled = YES;
    self.tap2.enabled = NO;
}


@end
