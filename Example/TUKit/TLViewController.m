//
//  TLViewController.m
//  TUKit
//
//  Created by i19850511@gmail.com on 03/28/2020.
//  Copyright (c) 2020 i19850511@gmail.com. All rights reserved.
//

#import "TLViewController.h"
#import <TUKit/TUKit.h>

@interface TLViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *largeImageView;
@property (nonatomic, weak) IBOutlet UIImageView *midumImageView;
@property (nonatomic, weak) IBOutlet UIImageView *smallImageView;
@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self.largeImageView t_setImageWithURL:[NSURL URLWithString:@"https://www.google.com.hk/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&psig=AOvVaw3q_ch-iAcMbMlGCOViwLdo&ust=1586417294368000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCSsoyn2OgCFQAAAAAdAAAAABAH"]
						  placeholderImage:[UIImage imageNamed:@"empty_holder"]];
	
	
	[self.midumImageView t_setImageWithURL:[NSURL URLWithString:@"https://www.google.com.hk/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Flove%2F&psig=AOvVaw03QDDhNZR2EjkekPvXswZ3&ust=1586417316708000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOCPxpen2OgCFQAAAAAdAAAAABAI"]];
	
	[self.smallImageView t_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586341127462&di=0c0fd55893ad5afc42a8bf0f8526a574&imgtype=0&src=http%3A%2F%2Freview.gbtcdn.com%2Fupload%2Fgearbest%2Favatar%2F20170918%2F3A2F7981C9FBB22B6CB0AC702C245916.jpg"]
						  placeholderImage:[UIImage imageNamed:@"empty_holder"]];
	
}


@end
