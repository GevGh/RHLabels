//
//  RHNumberPointView.h
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-13.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RHLabelConfig;

NS_ASSUME_NONNULL_BEGIN

@interface RHNumberPointView : UIView

@property (strong, nonatomic) NSString *text;
- (void)animateToValue:(NSString *)toValue withTime:(NSTimeInterval )timeInterval;

@property (nonatomic, readonly) double width;

- (void)configChange:(RHLabelConfig *)config;

@end

NS_ASSUME_NONNULL_END
