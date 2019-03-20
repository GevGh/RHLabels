//
//  RHLabelConfig.h
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-20.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RHLabelConfig : NSObject

@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) UIColor *textColor;

+ (instancetype)defaultConfig;

@end

NS_ASSUME_NONNULL_END
