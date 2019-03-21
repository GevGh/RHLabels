//
//  RHNumberPointView.m
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-13.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import "RHNumberPointView.h"
#import "RHLabelConfig.h"

typedef enum {
    RHTop,
    RHCenter,
    RHBottom
} RHDirection;

typedef enum {
    RHLabelCenter = 5,
    RHLabelNotCenter = 7
} RHLabelDirectionType;


@interface RHNumberPointView ()

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;

@property (strong, nonatomic) NSNumber *currentNumber;

@end

@implementation RHNumberPointView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        self.label1 = [[UILabel alloc] init];
        self.label2 = [[UILabel alloc] init];
        
//        self.label1.backgroundColor = [UIColor redColor];
//        self.label2.backgroundColor = [UIColor yellowColor];
        
        self.label1.textAlignment = NSTextAlignmentCenter;
        self.label2.textAlignment = NSTextAlignmentCenter;

        [self addSubview:self.label1];
        [self addSubview:self.label2];
        [self layout];
    }
    return self;
}

- (void)configChange:(RHLabelConfig *)config {
    
    if (config.font) {
        self.label1.font = config.font;
        self.label2.font = config.font;
        [self.label1 sizeToFit];
        [self.label2 sizeToFit];
    }
    if (config.textColor) {
        self.label1.textColor = config.textColor;
        self.label2.textColor = config.textColor;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label1.frame = CGRectMake(self.label1.frame.origin.x,
                                   self.label1.frame.origin.y,
                                   self.label1.frame.size.width,
                                   self.frame.size.height);
    self.label2.frame = CGRectMake(self.label2.frame.origin.x,
                                   self.label2.frame.origin.y,
                                   self.label2.frame.size.width,
                                   self.frame.size.height);
//    [self layout];
}

- (void)layout {

    [self changeViewDirection:self.label1 direction:RHCenter];
    [self changeViewDirection:self.label2 direction:RHTop];
}

- (void)changeViewDirection:(UIView *)view direction:(RHDirection )direction {
    
    CGRect frame = self.bounds;
    switch (direction) {
        case RHTop:
            frame.origin.y = -frame.size.height;
            view.frame = frame;
            view.tag = RHLabelNotCenter;
            break;
        case RHCenter:
            view.frame = frame;
            view.tag = RHLabelCenter;
            break;
        case RHBottom:
            frame.origin.y = frame.size.height;
            view.frame = frame;
            view.tag = RHLabelNotCenter;
            break;
        default:
            break;
    }
}

- (void)animateToValue:(NSString *)toValue withTime:(NSTimeInterval )timeInterval {
    NSDate *methodStart = [NSDate date];

    NSInteger initalValue = [self.text integerValue];
    NSInteger toValueInt = [toValue integerValue];
    NSLog(@"START");
    NSLog(@"%lu -> %li", (long)initalValue, (long)toValueInt);
    if (initalValue == toValueInt) {
        return;
    }
    BOOL moveUp = initalValue < toValueInt ? YES : NO;
    
    NSInteger change = labs(toValueInt - initalValue);
    NSTimeInterval deltaChange = timeInterval / change;
    
    NSLog(@"change %lu", (long)change);
    NSLog(@"deltaChange %f", deltaChange);
    
    [self recursiveAnimationWithDirection:moveUp
                                  toValue:toValueInt
                                 withTime:deltaChange
                               completion:^{
                                   NSLog(@"executionTime = %f", [[NSDate date] timeIntervalSinceDate:methodStart]);
                                   NSLog(@"FINISH");
                               }];
}

- (void)recursiveAnimationWithDirection:(BOOL)moveUp
                                toValue:(NSInteger )toValue
                               withTime:(NSTimeInterval )timeInterval
                             completion:(void(^)(void))completion {
    
    NSInteger currentValue = [self.text integerValue];
    NSInteger nextValue = moveUp ? currentValue + 1 : currentValue - 1;
    NSLog(@"%li -> %li", (long)currentValue, (long)nextValue);
    
//    if (toValue == nextValue) {
//        completion();
//        return;
//    }
    
    [self animateWithDirection:moveUp
                       toValue:@(nextValue)
                      withTime:timeInterval
                    completion:^{
                        if (nextValue == toValue) {
                            completion();
                            return;
                        }
                        [self recursiveAnimationWithDirection:moveUp
                                                      toValue:toValue
                                                     withTime:timeInterval
                                                   completion:completion];
                    }];
}

- (void)animateWithDirection:(BOOL)moveUp
                     toValue:(NSNumber *)toValue
                    withTime:(NSTimeInterval )timeInterval
                  completion:(void(^)(void))completion {
    
    UILabel *labelCentre = [self getLabelCentre];
    UILabel *labelNotCentre = [self getLabelNotCentre];
    
    labelCentre.text = self.text;
    labelNotCentre.text = [toValue stringValue];
    
    _text = [toValue stringValue];
    
    if (moveUp) {
        [self changeViewDirection:labelNotCentre direction:RHBottom];
    } else {
        [self changeViewDirection:labelNotCentre direction:RHTop];
    }
    
    [UIView animateWithDuration:timeInterval
                          delay:0
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
    
                         [self changeViewDirection:labelCentre direction:moveUp ? RHTop : RHBottom];
                         [self changeViewDirection:labelNotCentre direction:RHCenter];
                     } completion:^(BOOL finished) {
                         completion();
                     }];
}

- (UILabel *)getLabelNotCentre {
    if (self.label1.tag == RHLabelNotCenter) {
        return self.label1;
    }
    return self.label2;
}

- (UILabel *)getLabelCentre {
    if (self.label1.tag == RHLabelCenter) {
        return self.label1;
    }
    return self.label2;
}

- (void)setText:(NSString *)text {
    
    _text = text;
    [self layout];
    UILabel *labelCentre = [self getLabelCentre];
    labelCentre.text = text;
    [labelCentre sizeToFit];
}

- (double)width {
    double _width = [[self getLabelCentre] intrinsicContentSize].width;
    NSLog(@"_width %f", _width);
    return _width;
}

@end
