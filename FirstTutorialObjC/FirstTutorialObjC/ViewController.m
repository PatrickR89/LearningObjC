//
//  ViewController.m
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import "ViewController.h"
#import "MyClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    MyClass *instanceOfMyClass;

    instanceOfMyClass = [MyClass alloc];
    instanceOfMyClass = [instanceOfMyClass init];

    //shorter typing version below

    MyClass *secondInstance = [[MyClass alloc] init];

    int result = [secondInstance doSomething];
    int secondResult = [secondInstance privateMethod];

    printf("%d", secondResult);
}
- (int)sampleMethodWithReturnAndParam:(int)intParam
{
    MyClass *myClass = [[MyClass alloc] init];

    return [myClass doSomething];
}

@end
