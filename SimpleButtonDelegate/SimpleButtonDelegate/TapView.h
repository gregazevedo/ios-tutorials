//
//  TapView.h
//  SimpleButtonDelegate
//
//  Created by Greg Azevedo on 3/13/14.
//  Copyright (c) 2014 dolodev LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapButtonDelegate <NSObject>

-(void)doSomethingWhenITapTheButton;
-(void)undoWhateverTheDelegateDid;

@end


@interface TapView : UIView

@property (nonatomic) UITapGestureRecognizer *tap1;
@property (nonatomic) UITapGestureRecognizer *tap2;
@property (nonatomic, assign) id<TapButtonDelegate> delegate;

@end
