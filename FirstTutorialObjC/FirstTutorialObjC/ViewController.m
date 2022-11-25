//
//  ViewController.m
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import "ViewController.h"
#import "MyClass.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    MyClass *instanceOfMyClass;
//
//    instanceOfMyClass = [MyClass alloc];
//    instanceOfMyClass = [instanceOfMyClass init];

    //shorter typing version below

    MyClass *secondInstance = [[MyClass alloc] init];

//    int result = [secondInstance doSomething];
    int secondResult = [secondInstance privateMethod];

    printf("%d", secondResult);

//    MyClass *someNewInstance = [secondInstance retain]; -> retain to keep one more ref for new instance
//    MyClass *someNewInstance = secondInstance; -> with ARC, no need to manually retain

//    [instanceOfMyClass release]; -> not available in ARC

//    [someNewInstance release]: -> must release after use to avoid memory leak!

    Car *myCar = [[Car alloc] init];

    myCar.name = @"some car name";

    NSString *carName = myCar.name;
}
- (int)sampleMethodWithReturnAndParam:(int)intParam
{
    MyClass *myClass = [[MyClass alloc] init];

    return [myClass doSomething];
}

@end
