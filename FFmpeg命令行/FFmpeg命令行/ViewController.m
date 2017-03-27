//
//  ViewController.m
//  FFmpeg命令行
//
//  Created by qinmin on 2017/3/27.
//  Copyright © 2017年 qinmin. All rights reserved.
//

#import "ViewController.h"

extern int ffmpeg_main(int argc, char * argv[]);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *movie = [[NSBundle mainBundle] pathForResource:@"1.mp4" ofType:nil];
        NSString *tmpPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *outPic = [tmpPath stringByAppendingPathComponent:@"%05d.jpg"];
        char* a[] = {
            "ffmpeg",
            "-i",
            movie.UTF8String,
            "-r",
            "10",
            outPic.UTF8String
        };
        ffmpeg_main(6, a);
    });
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSString *tmpPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        NSString *outPic = [tmpPath stringByAppendingPathComponent:@"%05d.jpg"];
//        NSString *movie = [tmpPath stringByAppendingPathComponent:@"1.mp4"];
//        char* a[] = {
//            "ffmpeg",
//            "-i",
//            outPic.UTF8String,
//            "-vcodec",
//            "mpeg4",
//            movie.UTF8String
//        };
//        ffmpeg_main(6, a);
//    });
}

@end
