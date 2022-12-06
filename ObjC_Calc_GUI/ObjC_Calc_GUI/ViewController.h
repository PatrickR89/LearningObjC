//
//  ViewController.h
//  ObjC_Calc_GUI
//
//  Created by Patrick on 30.11.2022..
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *firstInputLabel;
@property (strong, nonatomic) UILabel *secondInputLabel;
@property (strong, nonatomic) UILabel *answer;
@property (strong, nonatomic) UILabel *answerResult;
@property (strong, nonatomic) UITextField *firstInputText;
@property (strong, nonatomic) UITextField *secondInputText;
@property (strong, nonatomic) UIButton *plus;
@property (strong, nonatomic) UIButton *minus;
@property (strong, nonatomic) UIButton *divide;
@property (strong, nonatomic) UIButton *multiply;
@property (strong, nonatomic) UIButton *clear;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;

- (UILabel*)createTitleLabel;
- (void) setupUI;
- (void) addButtonTargets;
- (void) addOperation;
- (void) minusOperation;
- (void) divideOperation;
- (void) multiplyOperation;
- (void) clearOperation;

@end

