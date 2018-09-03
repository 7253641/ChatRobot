//
//  TuLinAPINet.h
//  ChatRobot
//
//  Created by cxx on 2018/9/1.
//  Copyright © 2018 cxx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^APICallBack)(NSString*);
@interface TuLinAPINet : NSObject
+ (NSString*)getTuLinMessage:(NSString*)message;
@end
