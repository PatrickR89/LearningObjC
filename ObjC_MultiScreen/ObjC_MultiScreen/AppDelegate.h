//
//  AppDelegate.h
//  ObjC_MultiScreen
//
//  Created by Patrick on 06.12.2022..
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

