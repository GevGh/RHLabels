//
//  RHNumbersView.h
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-13.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHLabelConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface RHNumbersView : UIView

@property (strong, nonatomic) NSString *text;

@property (nonatomic) NSTimeInterval animationDuration;
@property (strong, nonatomic) RHLabelConfig *config;

@end

NS_ASSUME_NONNULL_END
