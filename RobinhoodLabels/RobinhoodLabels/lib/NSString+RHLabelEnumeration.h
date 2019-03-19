//
//  NSString+RHLabelEnumeration.h
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-17.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RHLabelEnumeration)

- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx))block;

@end

NS_ASSUME_NONNULL_END
