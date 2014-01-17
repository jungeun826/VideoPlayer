//
//  ViewController.m
//  VideoPlayer
//
//  Created by SDT-1 on 2014. 1. 16..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define MOVIE_URL @"http://movies.apple.com/media/kr/iphone/2011/tours/apple-iphone4s-feature_keynote-kr-20111110_r848-9cie.mov"
@interface ViewController (){
    MPMoviePlayerController *player;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleStateChanged:) name:@"MPMoviePlayerPlaybackStateDidChangeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMediaTypeNoti:) name:@"MPMovieSourceTypeAvailableNotification" object:nil];
    
    //NSURL *url = [[NSBundle mainBundle] URLForResource:@"movie" withExtension:@"mp4"];
    NSURL *url = [NSURL URLWithString:MOVIE_URL];
    
    NSAssert((url != nil), @"url is nil");
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [player prepareToPlay];
    
    [player.view setFrame:self.view.bounds];
    [self.view addSubview:player.view];
}
-(void)handleMediaTypeNoti:(NSNotification *)noti{
    MPMoviePlayerController *p = noti.object;
    NSLog(@"Media Source Type : %d", p.movieSourceType);
}
-(void)handleStateChanged:(NSNotification *)noti{
    MPMoviePlayerController *p = noti.object;
    NSLog(@"Playback state : %d", p.playbackState);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
