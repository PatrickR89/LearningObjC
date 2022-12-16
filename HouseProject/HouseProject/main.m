//
//  main.m
//  HouseProject
//
//  Created by Patrick on 16.12.2022..
//

#import <Foundation/Foundation.h>
#import "House.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        House *myHouse = [[House alloc] init];
        int number = myHouse.numberOfBedrooms;

        NSMutableString *adressString = [[NSMutableString alloc] initWithString: @"555 Park Ave."];
        House *myNewHouse = [[House alloc] initWithAddress:adressString];

        NSLog(@"Hello, World!");
        NSLog(@"%@", myNewHouse);
    }
    return 0;
}
