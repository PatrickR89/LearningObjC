//
//  ViewController.m
//  ObjC_Calc_GUI
//
//  Created by Patrick on 30.11.2022..
//

#import "ViewController.h"

@interface ViewController ()

- (UILabel*)createTitleLabel;
- (void) setupUI;


@end

@implementation ViewController

{
    UILabel *titleLabel;
    UILabel *firstInputLabel;
    UILabel *secondInputLabel;
    UILabel *answer;
    UILabel *answerResult;
    UITextField *firstInputText;
    UITextField *secondInputText;
    UIButton *plus;
    UIButton *minus;
    UIButton *divide;
    UIButton *multiply;
    UIButton *clear;
    UIImageView *imageView;
    UIImage *image;
}

- (void) loadView {
    [super loadView];

    titleLabel = self.createTitleLabel;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupUI];
    self.view.backgroundColor = UIColor.whiteColor;

}

- (UILabel*)createTitleLabel {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    titleLabel.textColor = UIColor.blackColor;
    [self.view addSubview:titleLabel];

    [titleLabel.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [titleLabel.heightAnchor constraintEqualToConstant:50].active = YES;
    [titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;

    titleLabel.text = @"My Calc";

    return titleLabel;
}

- (void)setupUI {
    firstInputLabel = [[UILabel alloc] init];
    secondInputLabel = [[UILabel alloc] init];
    answer = [[UILabel alloc] init];
    answerResult = [[UILabel alloc] init];
    firstInputText = [[UITextField alloc] init];
    secondInputText = [[UITextField alloc] init];
    plus = [[UIButton alloc] init];
    minus = [[UIButton alloc] init];
    divide = [[UIButton alloc] init];
    multiply = [[UIButton alloc] init];
    clear = [[UIButton alloc] init];
    imageView = [[UIImageView alloc] init];

    NSMutableArray *views = [[NSMutableArray alloc] init];
    [views addObject:firstInputLabel];
    [views addObject:secondInputLabel];
    [views addObject:answer];
    [views addObject:answerResult];
    [views addObject:firstInputText];
    [views addObject:secondInputText];

    NSMutableArray *buttons = [[NSMutableArray alloc] init];

    [buttons addObject:plus];
    [buttons addObject:minus];
    [buttons addObject:divide];
    [buttons addObject:multiply];
    [buttons addObject:clear];


    for (UIView *view in views) {
        [self.view addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = false;
        [view.heightAnchor constraintEqualToConstant:40].active = YES;
    }

    [self.view addSubview:imageView];
    imageView.translatesAutoresizingMaskIntoConstraints = false;

    [firstInputLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: -100].active = YES;
    [secondInputLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: -100].active = YES;
    [answer.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: -100].active = YES;
    [firstInputText.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: 100].active = YES;
    [secondInputText.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: 100].active = YES;
    [answerResult.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: 100].active = YES;
    [firstInputLabel.widthAnchor constraintEqualToConstant: 150].active = YES;
    [secondInputLabel.widthAnchor constraintEqualToAnchor: firstInputLabel.widthAnchor].active = YES;
    [answer.widthAnchor constraintEqualToAnchor: firstInputLabel.widthAnchor].active = YES;
    [firstInputText.widthAnchor constraintEqualToAnchor: firstInputLabel.widthAnchor].active = YES;
    [secondInputText.widthAnchor constraintEqualToAnchor: firstInputLabel.widthAnchor].active = YES;
    [answerResult.widthAnchor constraintEqualToAnchor: firstInputLabel.widthAnchor].active = YES;
    [firstInputText.centerYAnchor constraintEqualToAnchor: firstInputLabel.centerYAnchor].active = YES;
    [secondInputText.centerYAnchor constraintEqualToAnchor: secondInputLabel.centerYAnchor].active = YES;
    [answerResult.centerYAnchor constraintEqualToAnchor: answer.centerYAnchor].active = YES;
    [firstInputLabel.topAnchor constraintEqualToAnchor: titleLabel.bottomAnchor constant:80].active = YES;
    [secondInputLabel.topAnchor constraintEqualToAnchor:firstInputLabel.bottomAnchor constant:40].active = YES;
    [answer.topAnchor constraintEqualToAnchor:secondInputLabel.bottomAnchor constant:40].active = YES;

    firstInputLabel.text = @"Enter first value:";
    firstInputLabel.textColor = UIColor.systemRedColor;
    secondInputLabel.text = @"Enter second value:";
    secondInputLabel.textColor = UIColor.systemRedColor;
    answer.text = @"Result:";
    answer.textColor = UIColor.systemRedColor;

    firstInputText.layer.borderColor = UIColor.blackColor.CGColor;
    firstInputText.layer.borderWidth = 1;
    firstInputText.layer.cornerRadius = 10;
    firstInputText.textAlignment = NSTextAlignmentRight;
    firstInputText.textColor = UIColor.blackColor;
    secondInputText.layer.borderColor = UIColor.blackColor.CGColor;
    secondInputText.layer.borderWidth = 1;
    secondInputText.layer.cornerRadius = 10;
    secondInputText.textAlignment = NSTextAlignmentRight;
    secondInputText.textColor = UIColor.blackColor;
    answerResult.text = @"0";
    answerResult.textAlignment = NSTextAlignmentRight;
    answerResult.textColor = UIColor.blackColor;

    for (UIButton * button in buttons) {
        [self.view addSubview:button];
        button.translatesAutoresizingMaskIntoConstraints = false;
        [button.heightAnchor constraintEqualToConstant:40].active = YES;
        [button setTitleColor: UIColor.blackColor forState: UIControlStateNormal];
        [button setBackgroundColor: UIColor.blueColor];
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.blackColor.CGColor;
        button.layer.cornerRadius = 10;
        [button.widthAnchor constraintEqualToConstant:70].active = YES;

    }

    [plus.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-155].active = YES;
    [plus setTitle: @"+" forState: UIControlStateNormal];
    [plus.topAnchor constraintEqualToAnchor:answer.bottomAnchor constant:15].active = YES;

    [minus.leadingAnchor constraintEqualToAnchor: plus.trailingAnchor constant:10].active = YES;
    [minus setTitle: @"-" forState: UIControlStateNormal];
    [minus.topAnchor constraintEqualToAnchor:answer.bottomAnchor constant:15].active = YES;

    [divide.leadingAnchor constraintEqualToAnchor: minus.trailingAnchor constant:10].active = YES;
    [divide setTitle: @"/" forState: UIControlStateNormal];
    [divide.topAnchor constraintEqualToAnchor:answer.bottomAnchor constant:15].active = YES;

    [multiply.leadingAnchor constraintEqualToAnchor: divide.trailingAnchor constant:10].active = YES;
    [multiply setTitle: @"*" forState: UIControlStateNormal];
    [multiply.topAnchor constraintEqualToAnchor:answer.bottomAnchor constant:15].active = YES;

    [clear.topAnchor constraintEqualToAnchor:plus.bottomAnchor constant:10].active = YES;
    [clear.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [clear setTitle: @"Clear" forState: UIControlStateNormal];
    [clear setBackgroundColor: UIColor.redColor];

    [imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:20].active = YES;
    [imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:500].active = true;
    [imageView setImage: [UIImage imageNamed:@"calc-proj-img1"]];

}

@end
