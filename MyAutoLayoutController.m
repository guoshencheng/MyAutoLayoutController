//
//  MyAutoLayoutController.m
//  test
//
//  Created by mac on 12/4/14.
//  Copyright (c) 2014 guoshencheng. All rights reserved.
//

//HeightWidthLeftTop,
//HeightWidthLeftBottom,
//HeightWidthRightTop,
//HeightWidthRightBottom,
//
//HeightWidthCenterLeftCenterRight,
//HeightWidthCenterLeftTop,
//HeightWidthCenterLeftBottom,
//HeightWidthLeftCenterTop,
//HeightWidthRightCenterTop
//
//HeightLeftRightTop,
//HeightLeftRightBottom,
//
//WidthTopBottomLeft,
//WidthTopBottomRight,
//
//TopLeftBottomRight

#import "MyAutoLayoutController.h"

@implementation MyAutoLayoutController

#pragma mark - PublicMethod

- (CGRect)updateFrameWithLayoutValue:(CGFloat)value1 forFrame:(CGRect)frame1 value:(CGFloat)value2 forFrame:(CGRect)frame2 value:(CGFloat)value3 forFrame:(CGRect)frame3 value:(CGFloat)value4 forFrame:(CGRect)frame4 {
    [self setAllValueAndFrameWithValue:value1 forFrame:frame1 value:value2 forFrame:frame2 value:value3 forFrame:frame3 value:value4 forFrame:frame4];
    [self handleFrameConfigure];
    return self.targetViewFrame;
}

- (id)initWithConstraintMode:(ConstraintMode)constraintMode value:(CGFloat)value1 forFrame:(CGRect)frame1 value:(CGFloat)value2 forFrame:(CGRect)frame2 value:(CGFloat)value3 forFrame:(CGRect)frame3 value:(CGFloat)value4 forFrame:(CGRect)frame4 targetViewFrame:(CGRect)targetViewFrame andSuperViewFrame:(CGRect)superViewFrame {
    if (self = [super init]) {
        self.constraintMode = constraintMode;
        self.targetViewFrame = targetViewFrame;
        self.superViewFrame = superViewFrame;
        [self setAllValueAndFrameWithValue:value1 forFrame:frame1 value:value2 forFrame:frame2 value:value3 forFrame:frame3 value:value4 forFrame:frame4];
        [self handleFrameConfigure];
    }
    return self;
}

#pragma mark - PrivateMethod

- (void)setAllValueAndFrameWithValue:(CGFloat)value1 forFrame:(CGRect)frame1 value:(CGFloat)value2 forFrame:(CGRect)frame2 value:(CGFloat)value3 forFrame:(CGRect)frame3 value:(CGFloat)value4 forFrame:(CGRect)frame4 {
    self.value1 = value1;
    self.value2 = value2;
    self.value3 = value3;
    self.value4 = value4;
    self.frame1 = frame1;
    self.frame2 = frame2;
    self.frame3 = frame3;
    self.frame4 = frame4;
}

- (void)handleFrameConfigure {
    if (self.constraintMode == HeightWidthLeftTop) {
        [self initWithHeight:self.value1 width:self.value2 leftConstraint:self.value3 forLeftFrame:self.frame3 topConstrint:self.value4 forTopFrame:self.frame4];
    } else if(self.constraintMode == HeightWidthLeftBottom) {
        [self initWithHeight:self.value1 width:self.value2 leftConstraint:self.value3 forLeftFrame:self.frame3  bottomConstrint:self.value4 forBottomFrame:self.frame4];
    } else if(self.constraintMode == HeightWidthRightBottom) {
        [self initWithHeight:self.value1 width:self.value2 rightConstraint:self.value3 forRightFrame:self.frame3  bottomConstrint:self.value4 forBottomFrame:self.frame4];
    } else if(self.constraintMode == HeightWidthRightTop) {
        [self initWithHeight:self.value1 width:self.value2 rightConstraint:self.value3 forRightFrame:self.frame3  topConstrint:self.value4 forTopFrame:self.frame4];
    } else if (self.constraintMode == HeightLeftRightTop) {
        [self initWithHeight:self.value1 leftConstraint:self.value2 forLeftFrame:self.frame2 rightConstraint:self.value3 forRightFrame:self.frame3  topConstraint:self.value4 forTopFrame:self.frame4];
    } else if (self.constraintMode == HeightLeftRightBottom) {
        [self initWithHeight:self.value1 leftConstraint:self.value2 forLeftFrame:self.frame2 rightConstraint:self.value3 forRightFrame:self.frame3  bottomConstrint:self.value4 forBottomFrame:self.frame4];
    } else if (self.constraintMode == WidthTopBottomLeft) {
        [self initWithWidth:self.value1 topConstraint:self.value2 forTopFrame:self.frame2 bottomConstrint:self.value3 forBottomFrame:self.frame3  leftConstraint:self.value4 forLeftFrame:self.frame4];
    } else if (self.constraintMode == WidthTopBottomRight) {
        [self initWithWidth:self.value1 topConstraint:self.value2 forTopFrame:self.frame2 bottomConstrint:self.value3 forBottomFrame:self.frame3  rightConstraint:self.value4 forRightFrame:self.frame4];
    } else if (self.constraintMode == TopLeftBottomRight) {
        [self initWithTopConstrint:self.value1 forTopFrame:self.frame1 leftConstraint:self.value2 forLeftFrame:self.frame2 bottomConstrint:self.value3 forBottomFrame:self.frame3  rightConstraint:self.value4 forRightFrame:self.frame4];
    } else if (self.constraintMode == HeightWidthCenterLeftCenterTop) {
        [self initWithHeight:self.value1 width:self.value2 leftCenterConstraint:self.value3 topCenterConstrint:self.value4];
    } else if (self.constraintMode == HeightWidthCenterLeftTop) {
        [self initWithHeight:self.value1 width:self.value2 leftCenterConstraint:self.value3 topConstraint:self.value4 forTopFrame:self.frame4];
    } else if (self.constraintMode == HeightWidthCenterLeftBottom) {
        [self initWithHeight:self.value1 width:self.value2 leftCenterConstraint:self.value3 bottomConstraint:self.value4 forBottomFrame:self.frame4];
    } else if (self.constraintMode == HeightWidthLeftCenterTop) {
        [self initWithHeight:self.value1 width:self.value2 leftConstraint:self.value3  forLeftFrame:self.frame3 topCenterConstrint:self.value4];
    } else if (self.constraintMode == HeightWidthRightCenterTop) {
        [self initWithHeight:self.value1 width:self.value2 rightConstraint:self.value3 forRightFrame:self.frame3 topCenterConstrint:self.value4];
    }
}

#pragma mark - all AutoLayout Function

- (void)initWithTopConstrint:(CGFloat)topConstraint forTopFrame:(CGRect)topFrame leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame  bottomConstrint:(CGFloat)bottomConstraint forBottomFrame:(CGRect)bottomFrame rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rightFrame {
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstraint andTopViewFrame:topFrame];
    CGFloat frameSzieWidth = [self getFrameSizeWidthWithRightConstraint:rightConstraint andRightViewFrame:rightFrame andFrameOriginX:frameOriginX];
    CGFloat frameSizeHeight = [self getFrameSizeHeightBottomConstraint:bottomConstraint andBottomViewFrame:topFrame andFrameOriginY:frameOriginY];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, frameSzieWidth, frameSizeHeight);
}

- (void)initWithWidth:(CGFloat)width topConstraint:(CGFloat)topConstraint forTopFrame:(CGRect)topFrame bottomConstrint:(CGFloat)bottomConstraint forBottomFrame:(CGRect)bottomFrame rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rightFrame {
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstraint andTopViewFrame:topFrame];
    CGFloat frameSizeHeight = [self getFrameSizeHeightBottomConstraint:bottomConstraint andBottomViewFrame:topFrame andFrameOriginY:frameOriginY];
    CGFloat frameOriginX = [self getFrameOriginXWithRightConstraint:rightConstraint andRightFrame:rightFrame andFrameSizeWidth:width];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, width, frameSizeHeight);
}

- (void)initWithWidth:(CGFloat)width topConstraint:(CGFloat)topConstraint forTopFrame:(CGRect)topFrame bottomConstrint:(CGFloat)bottomConstraint forBottomFrame:(CGRect)bottomFrame leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame {
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstraint andTopViewFrame:topFrame];
    CGFloat frameSizeHeight = [self getFrameSizeHeightBottomConstraint:bottomConstraint andBottomViewFrame:bottomFrame andFrameOriginY:frameOriginY];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, width, frameSizeHeight);
}

- (void)initWithHeight:(CGFloat)height leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rightFrame bottomConstrint:(CGFloat)bottomConstrint forBottomFrame:(CGRect)bottomFrame {
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    CGFloat frameSizeWidth = [self getFrameSizeWidthWithRightConstraint:rightConstraint andRightViewFrame:rightFrame andFrameOriginX:frameOriginX];
    CGFloat frameOriginY = [self getFrameOriginYWithBottomConstraint:bottomConstrint andBottomFrame:bottomFrame andFrameSizeHeight:height];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, frameSizeWidth, height);
}

- (void)initWithHeight:(CGFloat)height leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rightFrame topConstraint:(CGFloat)topConstraint forTopFrame:(CGRect)topFrame{
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstraint andTopViewFrame:topFrame];
    CGFloat frameSizeWidth = [self getFrameSizeWidthWithRightConstraint:rightConstraint andRightViewFrame:rightFrame andFrameOriginX:frameOriginX];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, frameSizeWidth, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width leftCenterConstraint:(CGFloat)leftCenterConstraint topConstraint:(CGFloat)topConstraint forTopFrame:(CGRect)topFrame {
    CGFloat centerX = self.superViewFrame.size.width / 2 - width / 2;
    CGFloat newCenterX = centerX + leftCenterConstraint;
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstraint andTopViewFrame:topFrame];
    self.targetViewFrame = CGRectMake(newCenterX, frameOriginY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width leftCenterConstraint:(CGFloat)leftCenterConstraint  bottomConstraint:(CGFloat)bottomConstraint forBottomFrame:(CGRect)bottomFrame {
    CGFloat centerX = self.superViewFrame.size.width / 2 - width / 2;
    CGFloat newCenterX = centerX + leftCenterConstraint;
    CGFloat frameOriginY = [self getFrameOriginYWithBottomConstraint:bottomConstraint andBottomFrame:bottomFrame andFrameSizeHeight:height];
    self.targetViewFrame = CGRectMake(newCenterX, frameOriginY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame topCenterConstrint:(CGFloat)topCenterConstrint {
    CGFloat centerY = self.superViewFrame.size.height / 2 - height / 2;
    CGFloat newCenterY = centerY + topCenterConstrint;
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    self.targetViewFrame = CGRectMake(frameOriginX, newCenterY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rigihtFrame topCenterConstrint:(CGFloat)topCenterConstrint {
    CGFloat centerY = self.superViewFrame.size.height / 2 - height / 2;
    CGFloat newCenterY = centerY + topCenterConstrint;
    CGFloat frameOriginX = [self getFrameOriginXWithRightConstraint:rightConstraint andRightFrame:rigihtFrame andFrameSizeWidth:width];
    self.targetViewFrame = CGRectMake(frameOriginX, newCenterY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width leftCenterConstraint:(CGFloat)leftCenterConstraint topCenterConstrint:(CGFloat)topCenterConstrint  {
    CGFloat centerX = self.superViewFrame.size.width / 2 - width / 2;
    CGFloat centerY = self.superViewFrame.size.height / 2 - height / 2;
    CGFloat newCenterX = centerX + leftCenterConstraint;
    CGFloat newCenterY = centerY + topCenterConstrint;
    self.targetViewFrame = CGRectMake(newCenterX, newCenterY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame topConstrint:(CGFloat)topConstrint forTopFrame:(CGRect)topFrame {
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstrint andTopViewFrame:topFrame];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width leftConstraint:(CGFloat)leftConstraint forLeftFrame:(CGRect)leftFrame bottomConstrint:(CGFloat)bottomConstrint forBottomFrame:(CGRect)bottomFrame  {
    CGFloat frameOriginX = [self getFrameOriginXWithLeftConstraint:leftConstraint andLeftViewFrame:leftFrame];
    CGFloat frameOriginY = [self getFrameOriginYWithBottomConstraint:bottomConstrint andBottomFrame:bottomFrame andFrameSizeHeight:height];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rightFrame bottomConstrint:(CGFloat)bottomConstrint forBottomFrame:(CGRect)bottomFrame  {
    CGFloat frameOriginX = [self getFrameOriginXWithRightConstraint:rightConstraint andRightFrame:rightFrame andFrameSizeWidth:width];
    CGFloat frameOriginY = [self getFrameOriginYWithBottomConstraint:bottomConstrint andBottomFrame:bottomFrame andFrameSizeHeight:height];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, width, height);
}

- (void)initWithHeight:(CGFloat)height width:(CGFloat)width rightConstraint:(CGFloat)rightConstraint forRightFrame:(CGRect)rightFrame topConstrint:(CGFloat)topConstrint forTopFrame:(CGRect)topFrame {
    CGFloat frameOriginX = [self getFrameOriginXWithRightConstraint:rightConstraint andRightFrame:rightFrame andFrameSizeWidth:width];
    CGFloat frameOriginY = [self getFrameOriginYWithTopConstraint:topConstrint andTopViewFrame:topFrame];
    self.targetViewFrame = CGRectMake(frameOriginX, frameOriginY, width, height);
}

#pragma mark - based function

- (CGFloat)getFrameOriginXWithLeftConstraint:(CGFloat)leftConstraint andLeftViewFrame:(CGRect)leftViewFrame {
    CGFloat frameOriginX = 0.0;
    if ([self isEqualBetweenRect:leftViewFrame andAntherRect:SUPER_RECT]) {
        frameOriginX = leftConstraint;
    } else {
        frameOriginX = leftViewFrame.origin.x + leftViewFrame.size.width + leftConstraint;
    }
    return  frameOriginX;
}

- (CGFloat)getFrameOriginYWithTopConstraint:(CGFloat)topConstraint andTopViewFrame:(CGRect)TopViewFrame {
    CGFloat frameOriginY = 0.0;
    if ([self isEqualBetweenRect:TopViewFrame andAntherRect:SUPER_RECT]) {
        frameOriginY = topConstraint;
    } else {
        frameOriginY = TopViewFrame.origin.y + TopViewFrame.size.height + topConstraint;
    }
    return  frameOriginY;
}

- (CGFloat)getFrameSizeWidthWithRightConstraint:(CGFloat)rightConstraint andRightViewFrame:(CGRect)rightViewFrame andFrameOriginX:(CGFloat)frameOriginX {
    CGFloat frameSizeWidth = 0.0;
    if ([self isEqualBetweenRect:rightViewFrame andAntherRect:SUPER_RECT]) {
        frameSizeWidth = self.superViewFrame.size.width - frameOriginX - rightConstraint;
    } else {
        frameSizeWidth = rightViewFrame.origin.x - frameOriginX - rightConstraint;
    }
    return frameSizeWidth;
}

- (CGFloat)getFrameSizeHeightBottomConstraint:(CGFloat)bottomConstraint andBottomViewFrame:(CGRect)bottomViewFrame andFrameOriginY:(CGFloat)frameOriginY {
    CGFloat frameSizeHeight = 0.0;
    if ([self isEqualBetweenRect:bottomViewFrame andAntherRect:SUPER_RECT]) {
        frameSizeHeight = self.superViewFrame.size.height - frameOriginY - bottomConstraint;
    } else {
        frameSizeHeight = bottomViewFrame.origin.y - frameOriginY - bottomConstraint;
    }
    return frameSizeHeight;
}

- (CGFloat)getFrameOriginXWithRightConstraint:(CGFloat)rightConstraint andRightFrame:(CGRect)rightFrame andFrameSizeWidth:(CGFloat)width {
    CGFloat frameOriginX = 0.0;
    if ([self isEqualBetweenRect:rightFrame andAntherRect:SUPER_RECT]) {
        frameOriginX = self.superViewFrame.size.width - rightConstraint - width;
    } else {
        frameOriginX = rightFrame.origin.x - rightConstraint - width;
    }
    return  frameOriginX;
}

- (CGFloat)getFrameOriginYWithBottomConstraint:(CGFloat)bottomConstraint andBottomFrame:(CGRect)bottomFrame andFrameSizeHeight:(CGFloat)
height {
    CGFloat frameOrightY = 0.0;
    if ([self isEqualBetweenRect:bottomFrame andAntherRect:SUPER_RECT]) {
        frameOrightY = self.superViewFrame.size.height - bottomConstraint - height;
    } else {
        frameOrightY = bottomFrame.origin.y - bottomConstraint - height;
    }
    return frameOrightY;
}

#pragma mark - Rect tools

- (BOOL)isEqualBetweenRect:(CGRect)rect1 andAntherRect:(CGRect)rect2 {
    BOOL isEqual = NO;
    if (rect1.origin.x == rect2.origin.x && rect1.origin.y == rect2.origin.y && rect1.size.width == rect2.size.width && rect1.size.height == rect2.size.height) {
        isEqual = YES;
    }
    return isEqual;
}

@end
