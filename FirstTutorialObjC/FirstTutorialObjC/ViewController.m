//
//  ViewController.m
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import "ViewController.h"

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
}


@end
