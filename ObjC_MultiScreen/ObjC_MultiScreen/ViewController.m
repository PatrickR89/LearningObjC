//
//  ViewController.m
//  ObjC_MultiScreen
//
//  Created by Patrick on 06.12.2022..
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    [self setupUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;

}

- (void)setupUI {
    _buttonForDetails = [[UIButton alloc] init];
    [self.view addSubview:_buttonForDetails];
    _buttonForDetails.translatesAutoresizingMaskIntoConstraints = false;

    [_buttonForDetails setTitle:@"open new view" forState:UIControlStateNormal];
    [_buttonForDetails setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];

    [_buttonForDetails.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [_buttonForDetails.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    [_buttonForDetails.widthAnchor constraintEqualToConstant:200].active = true;
    [_buttonForDetails.heightAnchor constraintEqualToConstant:50].active = true;

    _buttonForDetails.backgroundColor = UIColor.redColor;
    _buttonForDetails.layer.borderColor = UIColor.blackColor.CGColor;
    _buttonForDetails.layer.borderWidth = 4;
    _buttonForDetails.layer.cornerRadius = 10;

    [_buttonForDetails addTarget:self action:@selector(createNewViewController) forControlEvents:UIControlEventTouchUpInside];
}

- (void)createNewViewController {
    UINavigationController *navController = [[UINavigationController alloc] init];
    UIViewController *detailViewController = [[DetailViewController alloc] init];
//    NSArray<UIViewController *> *children = @[detailViewController];
    [navController addChildViewController:detailViewController];

    [self presentViewController:navController animated:true completion:nil];
}

@end
