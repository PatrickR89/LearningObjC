//
//  AppDelegate.h
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

