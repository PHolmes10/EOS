//
//  AppDelegate.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        
//        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
//        var vc: UIViewController
//
//        if (UserDefaults.standard.value(forKey: "name") as? String) == nil {
//            //show onboarding screen
//            vc = storyboard.instantiateViewController(withIdentifier: "Onboarding1")
//        } else {
//            //show main screen
//            vc = MainTabBarController()
//        }
        
        window?.rootViewController = MainTabBarController()
        
        
        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = UIColor.clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = UIColor(red: 100.0 / 255.0, green: 180.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
        
        let navBar = UINavigationBar.appearance()
        navBar.tintColor = .white
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
//        if (UIApplication.shared.topViewController() as? PodcastViewController) != nil || (UIApplication.shared.topViewController() as? MeditationViewController) != nil {
//        print("Messages viewcontroller is visible and open")
//
//        UIApplication.mainTabBarController()?.minimizePlayerDetails()
//
//        }
        
//        NotificationCenter.default.addObserver(forName: .audioOpened, object: nil, queue: nil) { (notification) in
//
//            let playerDV = notification.object as! PlayerDetailsView
//
//            if playerDV.nowPlaying == true {
//            UIApplication.mainTabBarController()?.minimizePlayerDetails()
//            }
//        }
        
        NotificationCenter.default.post(name: .audioOpened, object: self)

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "EOS")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

//access delegate application
let ad = UIApplication.shared.delegate as! AppDelegate
//save into database
let context = ad.persistentContainer.viewContext

