//
//  MyClass.m
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import "MyClass.h"

@interface MyClass()

{
    int myPrivateNumber;
}

- (int)privateMethodFromPrivateInterface;

@end

@implementation MyClass

- (int)doSomething
{
    return 100;
}

- (int)privateMethod
{
    return [self privateMethodFromPrivateInterface];
}

- (int)privateMethodFromPrivateInterface
{
    return 25;
}
@end
