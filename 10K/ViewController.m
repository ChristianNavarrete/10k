//
//  ViewController.m
//  10K
//
//  Created by HoodsDream on 11/8/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.textField.alpha = 0.5f;
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.alpha = 0.5;
    
        [super viewDidLoad];
        
        //Not affecting background music playing
        NSError *sessionError = nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&sessionError];
        [[AVAudioSession sharedInstance] setActive:YES error:&sessionError];
        
        //Set up player
        NSURL *movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"purple" ofType:@"mp4"]];
        AVAsset *avAsset = [AVAsset assetWithURL:movieURL];
        AVPlayerItem *avPlayerItem =[[AVPlayerItem alloc]initWithAsset:avAsset];
        self.avplayer = [[AVPlayer alloc]initWithPlayerItem:avPlayerItem];
        AVPlayerLayer *avPlayerLayer =[AVPlayerLayer playerLayerWithPlayer:self.avplayer];
        [avPlayerLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        [avPlayerLayer setFrame:[[UIScreen mainScreen] bounds]];
        [self.movieView.layer addSublayer:avPlayerLayer];
        
        //Config player
        [self.avplayer seekToTime:kCMTimeZero];
        [self.avplayer setVolume:0.0f];
        [self.avplayer setActionAtItemEnd:AVPlayerActionAtItemEndNone];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:[self.avplayer currentItem]];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerStartPlaying)
                                                     name:UIApplicationDidBecomeActiveNotification object:nil];
        
      
    
    }
    
    - (void)viewWillDisappear:(BOOL)animated
    {
        [super viewWillDisappear:animated];
        [self.avplayer pause];
    }
    
    - (void)viewDidAppear:(BOOL)animated
    {
        [super viewDidAppear:animated];
        [self.avplayer play];
    }
    
    - (void)dealloc
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    
    - (void)playerItemDidReachEnd:(NSNotification *)notification {
        AVPlayerItem *p = [notification object];
        [p seekToTime:kCMTimeZero];
    }
    
    - (void)playerStartPlaying
    {
        [self.avplayer play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
