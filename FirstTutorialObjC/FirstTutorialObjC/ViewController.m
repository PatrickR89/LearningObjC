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
    [ myCar setName: @"honda"];

    NSString *carName = myCar.name;

    int age = 10;

    if (age > 10) {
        // do something
    } else if (age > 7){
        // do else if
    } else {
        // do something new if no condition met
    }

    if (age == 0 || age == 10) {
        // do it!!!!
    }

    switch (age) {
        case 5:
            // do
            break;
            // if two cases return same result/callback
        case 7:
        case 9:
            // do 7
            break;
        case 10:
            // do 10
            break;
        default:
            break;
    }

    NSString *name = @"Cory";

    if ([name isEqualToString: @"Cory"]) {
        //do something if name equals
    } else {
        // do somthing else if it does not
    }
}
- (int)sampleMethodWithReturnAndParam:(int)intParam
{
    MyClass *myClass = [[MyClass alloc] init];

    return [myClass doSomething];
}

@end
