//
//  DetailViewController.m
//  ObjC_MultiScreen
//
//  Created by Patrick on 06.12.2022..
//

#import "DetailViewController.h"

@interface DetailViewController ()

-(void)closeSelf;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;

    self.navigationItem.title = @"new VC";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closeSelf)];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)closeSelf {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
