//
//  ModelData.h
//  ChatRobot
//
//  Created by cxx on 2018/9/1.
//  Copyright © 2018 cxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "JSQMessages.h"

static NSString * const kJSQDemoAvatarDisplayNameMe = @"me";
static NSString * const kJSQDemoAvatarDisplayNameRobot = @"Ai Robot";

static NSString * const kJSQDemoAvatarIdMe = @"053496-4509-289";
static NSString * const kJSQDemoAvatarIdRobot = @"468-768355-23123";



@interface ModelData : NSObject

@property (strong, nonatomic) NSMutableArray *messages; // message数组

@property (strong, nonatomic) NSDictionary *avatars; // 聊天人所有头像

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData; // 发出去的气泡颜色

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData; // 收到的气泡颜色

@property (strong, nonatomic) NSDictionary *users; // 用户名字信息

- (void)addPhotoMediaMessage;//!< 图片消息

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion; //!< 定位小心

- (void)addVideoMediaMessage; //!< 视频 无底图

- (void)addVideoMediaMessageWithThumbnail; //!< 视频带底图

- (void)addAudioMediaMessage; //!< 音频


@end
