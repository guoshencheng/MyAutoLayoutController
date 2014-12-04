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

#define SUPER_RECT CGRectMake(0, 0, 0, 0)

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
//constraints to other view
@property (assign, nonatomic) CGFloat constraintOfLeftView;
@property (assign, nonatomic) CGFloat constraintOfTopView;
@property (assign, nonatomic) CGFloat constraintOfRightiew;
@property (assign, nonatomic) CGFloat constraintOfBottomView;

//frame of target
@property (assign, nonatomic) CGRect targetViewFrame;

//frame of connect View
@property (assign, nonatomic) CGRect superViewFrame;

@property (assign, nonatomic) CGRect leftBrotherViewFrame;
@property (assign, nonatomic) CGRect rightBrotherViewFrame;
@property (assign, nonatomic) CGRect topBrotherViewFrame;
@property (assign, nonatomic) CGRect bottomBrotherViewFrame;

- (id)initWithConstraintMode:(ConstraintMode)constraintMode value:(CGFloat)value1 forFrame:(CGRect)frame1 value:(CGFloat)value2 forFrame:(CGRect)frame2 value:(CGFloat)value3 forFrame:(CGRect)frame3 value:(CGFloat)value4 forFrame:(CGRect)frame4 targetViewFrame:(CGRect)targetViewFrame andSuperViewFrame:(CGRect)superViewFrame;



@end
