//
//  ViewController.m
//  ObjC_Calc_GUI
//
//  Created by Patrick on 30.11.2022..
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) loadView {
    [super loadView];

    self.titleLabel = self.createTitleLabel;

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
    self.firstInputLabel = [[UILabel alloc] init];
    self.secondInputLabel = [[UILabel alloc] init];
    self.answer = [[UILabel alloc] init];
    self.answerResult = [[UILabel alloc] init];
    self.firstInputText = [[UITextField alloc] init];
    self.secondInputText = [[UITextField alloc] init];
    self.plus = [[UIButton alloc] init];
    self.minus = [[UIButton alloc] init];
    self.divide = [[UIButton alloc] init];
    self.multiply = [[UIButton alloc] init];
    self.clear = [[UIButton alloc] init];
    self.imageView = [[UIImageView alloc] init];

    NSMutableArray *views = [[NSMutableArray alloc] init];
    [views addObject:self.firstInputLabel];
    [views addObject:self.secondInputLabel];
    [views addObject:self.answer];
    [views addObject:self.answerResult];
    [views addObject:self.firstInputText];
    [views addObject:self.secondInputText];

    NSMutableArray *buttons = [[NSMutableArray alloc] init];

    [buttons addObject:self.plus];
    [buttons addObject:self.minus];
    [buttons addObject:self.divide];
    [buttons addObject:self.multiply];
    [buttons addObject:self.clear];


    for (UIView *view in views) {
        [self.view addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = false;
        [view.heightAnchor constraintEqualToConstant:40].active = YES;
    }

    [self.view addSubview:_imageView];
    _imageView.translatesAutoresizingMaskIntoConstraints = false;

    [_firstInputLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: -100].active = YES;
    [_secondInputLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: -100].active = YES;
    [_answer.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: -100].active = YES;
    [_firstInputText.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: 100].active = YES;
    [_secondInputText.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: 100].active = YES;
    [_answerResult.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor constant: 100].active = YES;
    [_firstInputLabel.widthAnchor constraintEqualToConstant: 150].active = YES;
    [_secondInputLabel.widthAnchor constraintEqualToAnchor: _firstInputLabel.widthAnchor].active = YES;
    [_answer.widthAnchor constraintEqualToAnchor: _firstInputLabel.widthAnchor].active = YES;
    [_firstInputText.widthAnchor constraintEqualToAnchor: _firstInputLabel.widthAnchor].active = YES;
    [_secondInputText.widthAnchor constraintEqualToAnchor: _firstInputLabel.widthAnchor].active = YES;
    [_answerResult.widthAnchor constraintEqualToAnchor: _firstInputLabel.widthAnchor].active = YES;
    [_firstInputText.centerYAnchor constraintEqualToAnchor: _firstInputLabel.centerYAnchor].active = YES;
    [_secondInputText.centerYAnchor constraintEqualToAnchor: _secondInputLabel.centerYAnchor].active = YES;
    [_answerResult.centerYAnchor constraintEqualToAnchor: _answer.centerYAnchor].active = YES;
    [_firstInputLabel.topAnchor constraintEqualToAnchor: _titleLabel.bottomAnchor constant:80].active = YES;
    [_secondInputLabel.topAnchor constraintEqualToAnchor:_firstInputLabel.bottomAnchor constant:40].active = YES;
    [_answer.topAnchor constraintEqualToAnchor:_secondInputLabel.bottomAnchor constant:40].active = YES;

    _firstInputLabel.text = @"Enter first value:";
    _firstInputLabel.textColor = UIColor.systemRedColor;
    _secondInputLabel.text = @"Enter second value:";
    _secondInputLabel.textColor = UIColor.systemRedColor;
    _answer.text = @"Result:";
    _answer.textColor = UIColor.systemRedColor;

    _firstInputText.layer.borderColor = UIColor.blackColor.CGColor;
    _firstInputText.layer.borderWidth = 1;
    _firstInputText.layer.cornerRadius = 10;
    _firstInputText.textAlignment = NSTextAlignmentRight;
    _firstInputText.textColor = UIColor.blackColor;
    _secondInputText.layer.borderColor = UIColor.blackColor.CGColor;
    _secondInputText.layer.borderWidth = 1;
    _secondInputText.layer.cornerRadius = 10;
    _secondInputText.textAlignment = NSTextAlignmentRight;
    _secondInputText.textColor = UIColor.blackColor;
    _answerResult.text = @"0";
    _answerResult.textAlignment = NSTextAlignmentRight;
    _answerResult.textColor = UIColor.blackColor;

    _firstInputText.delegate = self;
    _secondInputText.delegate = self;



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

    [_plus.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-155].active = YES;
    [_plus setTitle: @"+" forState: UIControlStateNormal];
    [_plus.topAnchor constraintEqualToAnchor:_answer.bottomAnchor constant:15].active = YES;

    [_minus.leadingAnchor constraintEqualToAnchor: _plus.trailingAnchor constant:10].active = YES;
    [_minus setTitle: @"-" forState: UIControlStateNormal];
    [_minus.topAnchor constraintEqualToAnchor:_answer.bottomAnchor constant:15].active = YES;

    [_divide.leadingAnchor constraintEqualToAnchor: _minus.trailingAnchor constant:10].active = YES;
    [_divide setTitle: @"/" forState: UIControlStateNormal];
    [_divide.topAnchor constraintEqualToAnchor:_answer.bottomAnchor constant:15].active = YES;

    [_multiply.leadingAnchor constraintEqualToAnchor: _divide.trailingAnchor constant:10].active = YES;
    [_multiply setTitle: @"*" forState: UIControlStateNormal];
    [_multiply.topAnchor constraintEqualToAnchor:_answer.bottomAnchor constant:15].active = YES;

    [_clear.topAnchor constraintEqualToAnchor:_plus.bottomAnchor constant:10].active = YES;
    [_clear.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [_clear setTitle: @"Clear" forState: UIControlStateNormal];
    [_clear setBackgroundColor: UIColor.redColor];

    [_imageView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:20].active = YES;
    [_imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [_imageView setImage: [UIImage imageNamed:@"calc-proj-img1"]];

    [self addButtonTargets];

}

- (void)addButtonTargets {
    [_plus addTarget:self action: @selector(addOperation) forControlEvents: UIControlEventTouchUpInside];
    [_minus addTarget:self action: @selector(minusOperation) forControlEvents: UIControlEventTouchUpInside];
    [_divide addTarget:self action: @selector(divideOperation) forControlEvents: UIControlEventTouchUpInside];
    [_multiply addTarget:self action: @selector(multiplyOperation) forControlEvents: UIControlEventTouchUpInside];
    [_clear addTarget:self action: @selector(clearOperation) forControlEvents: UIControlEventTouchUpInside];
}

- (void)addOperation {
    int result = [_firstInputText.text integerValue] + [_secondInputText.text integerValue];
    NSString* textResult = [NSString stringWithFormat:@"%i", result];
    _answerResult.text = textResult;
}
- (void)minusOperation {
    int result = [_firstInputText.text integerValue] - [_secondInputText.text integerValue];
    NSString* textResult = [NSString stringWithFormat:@"%i", result];
    _answerResult.text = textResult;
}
- (void)divideOperation {
    int result = [_firstInputText.text integerValue] / [_secondInputText.text integerValue];
    NSString* textResult = [NSString stringWithFormat:@"%i", result];
    _answerResult.text = textResult;
}
- (void)multiplyOperation {
    int result = [_firstInputText.text integerValue] * [_secondInputText.text integerValue];
    NSString* textResult = [NSString stringWithFormat:@"%i", result];
    _answerResult.text = textResult;
}
- (void)clearOperation {

    _firstInputText.text = @"";
    _secondInputText.text = @"";
    _answerResult.text = @"";
}

@end
