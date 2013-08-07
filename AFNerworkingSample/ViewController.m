//
//  ViewController.m
//  AFNerworkingSample
//
//  Created by Catherine Trishina on 06/08/2013.
//  Copyright (c) 2013 Catherine Trishina. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()
@property (atomic, strong) NSMutableData *receivedData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *urlAsString = @"https://api.twitter.com/1.1/search/tweets.json?q=%40twitterapi";
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        //success
        NSArray *tweets = [JSON valueForKeyPath:@"results.text"];
        NSLog(@"skyfall tweets: %@", tweets);
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        //error
        NSLog(@"Error contacting Twitter %@", [error localizedDescription]);
    }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


@end
