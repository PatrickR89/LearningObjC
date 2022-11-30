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
}

- (void) loadView {
    [super loadView];

    titleLabel = self.createTitleLabel;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    self.setupUI;
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

    NSMutableArray *views = [[NSMutableArray alloc] init];
    [views addObject:firstInputLabel];
    [views addObject:secondInputLabel];
    [views addObject:answer];
    [views addObject:answerResult];
    [views addObject:firstInputText];
    [views addObject:secondInputText];
    [views addObject:plus];
    [views addObject:minus];
    [views addObject:divide];
    [views addObject:multiply];
    [views addObject:clear];


    for (UIView *view in views) {
        [self.view addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = false;
        [view.heightAnchor constraintEqualToConstant:40].active = YES;
    }

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
}

@end
