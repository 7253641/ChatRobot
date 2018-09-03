//
//  TuLinAPINet.m
//  ChatRobot
//
//  Created by cxx on 2018/9/1.
//  Copyright © 2018 cxx. All rights reserved.
//

#import "TuLinAPINet.h"
@implementation TuLinAPINet
+ (NSString*)getTuLinMessage:(NSString*)message completionHandler:(APICallBack*)call{
    
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjectsAndKeys:@0,@"reqType",@{@"inputText":@{@"text":message}},@"perception",@{@"apiKey":@"952a4ca2eca74c73bf9913062691338c",@"userId":@"317322"},@"userInfo",nil];
    __block NSString * replyMessage = nil;
    // 1.创建一个网络路径
    NSURL *url = [NSURL URLWithString:@"http://openapi.tuling123.com/openapi/api/v2"];
    // 2.创建一个网络请求
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:paramsDic options:NSJSONWritingPrettyPrinted error:nil];
    // 3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.根据会话对象，创建一个Task任务：
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"从服务器获取到数据");
        /*
         对从服务器获取到的数据data进行相应的处理：
         */
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
        NSArray* results = [dict objectForKey:@"results"];
        for (NSDictionary *dic in results) {
            if ([dic[@"resultType"] isEqualToString:@"text"]) {
                replyMessage = dic[@"values"][@"text"];
                break;
            }
        }
    }];
    // 5.最后一步，执行任务（resume也是继续执行）:
    [sessionDataTask resume];
    
    return replyMessage;
}
@end
