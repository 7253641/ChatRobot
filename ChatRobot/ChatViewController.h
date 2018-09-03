//
//  ChatViewController.h
//  ChatRobot
//
//  Created by cxx on 2018/9/1.
//  Copyright © 2018 cxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSQMessages.h"
#import "ModelData.h"
@interface ChatViewController : JSQMessagesViewController<UIActionSheetDelegate,JSQMessagesComposerTextViewPasteDelegate,JSQMessagesViewAccessoryButtonDelegate>

@property (nonatomic,strong) ModelData *modelData;
- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

@end
