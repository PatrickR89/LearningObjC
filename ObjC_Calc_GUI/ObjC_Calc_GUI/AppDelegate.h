//
//  AppDelegate.h
//  ObjC_Calc_GUI
//
//  Created by Patrick on 30.11.2022..
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

