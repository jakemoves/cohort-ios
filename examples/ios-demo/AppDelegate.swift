//
//  AppDelegate.swift
//  ios-demo
//
//  Created by Jacob Niedzwiecki on 2018-09-29.
//  Copyright © 2018 Jacob Niedzwiecki. All rights reserved.
//

import UIKit
import Cohort_iOS
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userNotificationCenter: UNUserNotificationCenter?
    
    var cohortSession: CHSession?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        cohortSession = CHSession(cohortServerURL: URL(string: "http://jakemoves.local")!)
        cohortSession?.connect(completion: { (result) in
            if !result {
                debugPrint("failed to connect to cohort server")
            }
        })
        
        userNotificationCenter = UNUserNotificationCenter.current()
        
        let opts: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        userNotificationCenter?.requestAuthorization(options: opts, completionHandler: { (result, error) in
            if !result {
                debugPrint(error)
            }
        })
        
//        // to check after app startup
//        center.getNotificationSettings { (settings) in
//            if settings.authorizationStatus != .authorized {
//                // Notifications not allowed
//            }
//        }
        
        application.registerForRemoteNotifications()
        
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        debugPrint("token: \(deviceToken)")
        self.cohortSession?.registerForNotifications(token: deviceToken, completion: { (result) in
            if !result {
                debugPrint("Error registering for notifications")
            } else {
                debugPrint("registration result: \(result)")
            }
        })
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint(error)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

