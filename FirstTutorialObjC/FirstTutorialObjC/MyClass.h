//
//  MyClass.h
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyClass : NSObject

{
    @protected // private for class, when @public makes available for all classes, also @private
    int myInt;
    BOOL myBool;

    @private
    int mySecondInt;
}

- (int)doSomething;
- (int)privateMethod;

@end

NS_ASSUME_NONNULL_END
