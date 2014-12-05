//
//  MyAutoLayoutController.h
//  test
//
//  Created by mac on 12/4/14.
//  Copyright (c) 2014 guoshencheng. All rights reserved.
//

/*
 Useage
self.autoLayout1 = [[MyAutoLayoutController alloc] initWithConstraintMode:WidthTopBottomLeft value:100 forFrame:SUPER_RECT value:100 forFrame:SUPER_RECT value:100 forFrame:SUPER_RECT value:20 forFrame:SUPER_RECT targetViewFrame:SUPER_RECT andSuperViewFrame:self.view.frame];
self.leftView = [[UIView alloc] initWithFrame:self.autoLayout1.targetViewFrame];
self.leftView.backgroundColor = [UIColor redColor];
[self.view addSubview:self.leftView];
*/


#import <UIKit/UIKit.h>

#define SUPER_RECT CGRectZero

typedef enum  {
    HeightWidthLeftTop,
    HeightWidthLeftBottom,
    HeightWidthRightTop,
    HeightWidthRightBottom,
    
    HeightWidthCenterLeftCenterTop,
    HeightWidthCenterLeftTop,
    HeightWidthCenterLeftBottom,
    HeightWidthLeftCenterTop,
    HeightWidthRightCenterTop,
    
    HeightLeftRightTop,
    HeightLeftRightBottom,
    
    WidthTopBottomLeft,
    WidthTopBottomRight,
    
    TopLeftBottomRight
    
} ConstraintMode;

@interface MyAutoLayoutController : NSObject

@property (assign, nonatomic) ConstraintMode constraintMode;

@property (assign, nonatomic) CGFloat value1;
@property (assign, nonatomic) CGFloat value2;
@property (assign, nonatomic) CGFloat value3;
@property (assign, nonatomic) CGFloat value4;

//frame of target

@property (assign, nonatomic) CGRect targetViewFrame;

//frame of connect View

@property (assign, nonatomic) CGRect superViewFrame;

@property (assign, nonatomic) CGRect frame1;
@property (assign, nonatomic) CGRect frame2;
@property (assign, nonatomic) CGRect frame3;
@property (assign, nonatomic) CGRect frame4;

- (id)initWithConstraintMode:(ConstraintMode)constraintMode value:(CGFloat)value1 forFrame:(CGRect)frame1 value:(CGFloat)value2 forFrame:(CGRect)frame2 value:(CGFloat)value3 forFrame:(CGRect)frame3 value:(CGFloat)value4 forFrame:(CGRect)frame4 targetViewFrame:(CGRect)targetViewFrame andSuperViewFrame:(CGRect)superViewFrame;

- (CGRect)updateFrameWithLayoutValue:(CGFloat)value1 forFrame:(CGRect)frame1 value:(CGFloat)value2 forFrame:(CGRect)frame2 value:(CGFloat)value3 forFrame:(CGRect)frame3 value:(CGFloat)value4 forFrame:(CGRect)frame4;

//Public for it test in testTests.m

- (CGFloat)getFrameOriginYWithBottomConstraint:(CGFloat)bottomConstraint andBottomFrame:(CGRect)bottomFrame andFrameSizeHeight:(CGFloat)
height;
- (CGFloat)getFrameOriginXWithRightConstraint:(CGFloat)rightConstraint andRightFrame:(CGRect)rightFrame andFrameSizeWidth:(CGFloat)width;
- (CGFloat)getFrameSizeHeightBottomConstraint:(CGFloat)bottomConstraint andBottomViewFrame:(CGRect)bottomViewFrame andFrameOriginY:(CGFloat)frameOriginY;
- (CGFloat)getFrameSizeWidthWithRightConstraint:(CGFloat)rightConstraint andRightViewFrame:(CGRect)rightViewFrame andFrameOriginX:(CGFloat)frameOriginX;
- (CGFloat)getFrameOriginYWithTopConstraint:(CGFloat)topConstraint andTopViewFrame:(CGRect)TopViewFrame;
- (CGFloat)getFrameOriginXWithLeftConstraint:(CGFloat)leftConstraint andLeftViewFrame:(CGRect)leftViewFrame;

@end
