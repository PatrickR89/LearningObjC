//
//  ViewController.h
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import <UIKit/UIKit.h>
#import "MyClass.h"

@interface ViewController : UIViewController

- (void)sampleMethod;
// - -> instance method vs. + -> class method

+ (void)someClassMethod;

- (int)sampleMethodWithReturnAndParam:(int)intParam;
- (int)sampleMethodWithReturnAndParam:(int)intParam withBool:(BOOL)boolParam;

@end

