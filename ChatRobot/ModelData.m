//
//  ModelData.m
//  ChatRobot
//
//  Created by cxx on 2018/9/1.
//  Copyright © 2018 cxx. All rights reserved.
//

#import "ModelData.h"
#import "JSQMessagesAvatarImageFactory.h"



@implementation ModelData
- (instancetype)init{
    self = [super init];
    if (self) {
        [self addStartMessage];
        JSQMessagesAvatarImageFactory *avatarFactory = [[JSQMessagesAvatarImageFactory alloc] initWithDiameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *meImage = [avatarFactory avatarImageWithUserInitials:@"Me"
                                                                      backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f]
                                                                            textColor:[UIColor colorWithWhite:0.60f alpha:1.0f]
                                                                                 font:[UIFont systemFontOfSize:14.0f]];
        
        JSQMessagesAvatarImage *robotImage = [avatarFactory avatarImageWithImage:[UIImage imageNamed:@"img_robot"]];
        self.avatars = @{ kJSQDemoAvatarIdMe: meImage,
                          kJSQDemoAvatarIdRobot : robotImage};
        
        // 用户姓名  key ： value （name）
        self.users = @{ kJSQDemoAvatarIdMe : kJSQDemoAvatarDisplayNameMe,
                        kJSQDemoAvatarIdRobot : kJSQDemoAvatarDisplayNameRobot};
        
        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    }
    return self;
}
- (void)addStartMessage{
    self.messages = [[NSMutableArray alloc] initWithObjects:
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdRobot
                                        senderDisplayName:kJSQDemoAvatarDisplayNameRobot
                                                     date:[NSDate distantPast]
                                                     text:@"你好主人，我是你的聊天机器人，你有什么想对我说的吗？"], nil];
}


- (void)addAudioMediaMessage
{
    NSString * sample = [[NSBundle mainBundle] pathForResource:@"jsq_messages_sample" ofType:@"m4a"];
    NSData * audioData = [NSData dataWithContentsOfFile:sample];
    JSQAudioMediaItem *audioItem = [[JSQAudioMediaItem alloc] initWithData:audioData];
    JSQMessage *audioMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdMe
                                                   displayName:kJSQDemoAvatarDisplayNameMe
                                                         media:audioItem];
    [self.messages addObject:audioMessage];
}

- (void)addPhotoMediaMessage
{
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"goldengate"]];
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdMe
                                                   displayName:kJSQDemoAvatarDisplayNameMe
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
}

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion
{
    CLLocation *ferryBuildingInSF = [[CLLocation alloc] initWithLatitude:37.795313 longitude:-122.393757];
    
    JSQLocationMediaItem *locationItem = [[JSQLocationMediaItem alloc] init];
    [locationItem setLocation:ferryBuildingInSF withCompletionHandler:completion];
    
    JSQMessage *locationMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdMe
                                                      displayName:kJSQDemoAvatarDisplayNameMe
                                                            media:locationItem];
    [self.messages addObject:locationMessage];
}

- (void)addVideoMediaMessage
{
    // don't have a real video, just pretending
    NSURL *videoURL = [NSURL URLWithString:@"file://"];
    
    JSQVideoMediaItem *videoItem = [[JSQVideoMediaItem alloc] initWithFileURL:videoURL isReadyToPlay:YES];
    JSQMessage *videoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdMe
                                                   displayName:kJSQDemoAvatarDisplayNameMe
                                                         media:videoItem];
    [self.messages addObject:videoMessage];
}

- (void)addVideoMediaMessageWithThumbnail
{
    // don't have a real video, just pretending
    NSURL *videoURL = [NSURL URLWithString:@"file://"];
    
    JSQVideoMediaItem *videoItem = [[JSQVideoMediaItem alloc] initWithFileURL:videoURL isReadyToPlay:YES thumbnailImage:[UIImage imageNamed:@"goldengate"]];
    JSQMessage *videoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdMe
                                                   displayName:kJSQDemoAvatarDisplayNameMe
                                                         media:videoItem];
    [self.messages addObject:videoMessage];
}
@end
