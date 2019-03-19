//
//  RHNumbersView.h
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-13.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RHNumbersView : UIView

@property (nonatomic) NSTimeInterval animationDuration;
@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIColor *textColor;

@end

NS_ASSUME_NONNULL_END
