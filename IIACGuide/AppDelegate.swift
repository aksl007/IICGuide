//
//  AppDelegate.swift
//  incheon
//
//  Created by DD Dev on 2020/07/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        // [START set_messaging_delegate]
        Messaging.messaging().delegate = self
        // [END set_messaging_delegate]
        // Register for remote notifications. This shows a permission dialog on first run, to
        // show the dialog at a more appropriate time move this registration accordingly.
        // [START register_for_notifications]
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        // [END register_for_notifications]
        
        
        
        window = UIWindow()
        window?.rootViewController = SplashViewController()
        //        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        return true
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "IIACGuide")
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
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        
        
    }
    
    // [START receive_message]
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        //처음 알럿
        completionHandler(UIBackgroundFetchResult.newData)
    }
    // [END receive_message]
    
    
}

// [START ios_10_message_handling]
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([[.alert, .sound]])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print full message.
        print(userInfo)
        //클릭시
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
            
            let psgNumber = userInfo["psgNumber"] as! String
            if psgNumber == "" {
                //push myplan
                
                let popupVC = PopupViewController()
                popupVC.modalPresentationStyle = .overFullScreen
                popupVC.modalTransitionStyle = .crossDissolve
                
                popupVC.popupTitle = userInfo["title"] as! String
                
                for (key,value) in userInfo["aps"] as! NSDictionary {
                    
                    if key as! String == "alert" {
                        popupVC.popupContents = value as! String
                    }
                }
                let completion = {
                    let flightInfoDetailVC = FlightInfoDetailViewController()
                    
                    if userInfo["flightType"] as! String == "D" {
                        flightInfoDetailVC.type = "dep"
                    }else {
                        flightInfoDetailVC.type = "arr"
                    }
                    
                    flightInfoDetailVC.fimsFlightId = userInfo["fimsId"] as! String
                    (self.window?.rootViewController as! TabBarController).selectedIndex = 1
                    ((self.window?.rootViewController as! TabBarController).viewControllers?[1] as! UINavigationController).pushViewController(flightInfoDetailVC, animated: false)
                }
                popupVC.completion = completion
                popupVC.isTwoButton = true
                popupVC.isNoti = true
                self.window?.rootViewController?.present(popupVC, animated: false, completion: nil)
                
            }else{
                //push beacon
                let beaconBasePopupVC = BeaconBasePopupViewController()
                beaconBasePopupVC.modalPresentationStyle = .overFullScreen
                beaconBasePopupVC.modalTransitionStyle = .crossDissolve
                
                let flightName = userInfo["flightName"] as! String
                let departureTime = userInfo["departureTime"]  as! String
                let estimate = userInfo["estimate"] as! String
                let title = userInfo["title"] as! String
                beaconBasePopupVC.zoneCd = "PUSH"
                beaconBasePopupVC.preFlightName = flightName
                beaconBasePopupVC.preDepartureTime = departureTime
                beaconBasePopupVC.preEstimate = estimate
                beaconBasePopupVC.preTitle = title
                
                
                let completion = {
                    if CommonUtils.isKorean() {
                        let prohibitedItemTabVC = ProhibitedItemTabViewController()
                        (self.window?.rootViewController as! TabBarController).selectedIndex = 1
                        ((self.window?.rootViewController as! TabBarController).viewControllers?[1] as! UINavigationController).pushViewController(prohibitedItemTabVC, animated: false)
                    }else{
                        let prohibitedItemVC = ProhibitedItemViewController()
                        (self.window?.rootViewController as! TabBarController).selectedIndex = 1
                        ((self.window?.rootViewController as! TabBarController).viewControllers?[1] as! UINavigationController).pushViewController(prohibitedItemVC, animated: false)
                    }
                }
                beaconBasePopupVC.completion = completion
                
                self.window?.rootViewController?.present(beaconBasePopupVC, animated: false, completion: nil)
                
            }
            
        }else{
            //beacon
            
            let zoneCd = userInfo["zoneCd"] as! String
            let terminalId = userInfo["terminalId"] as! String
            
            let beaconBasePopupVC = BeaconBasePopupViewController()
            beaconBasePopupVC.modalPresentationStyle = .overFullScreen
            beaconBasePopupVC.modalTransitionStyle = .crossDissolve
            beaconBasePopupVC.zoneCd = zoneCd
            beaconBasePopupVC.terminalId = userInfo["terminalId"] as! String
            beaconBasePopupVC.fimsid = userInfo["fimsid"] as! String
            beaconBasePopupVC.flightPid = userInfo["flightPid"] as! String
            beaconBasePopupVC.checkin = userInfo["checkin"] as! String
            beaconBasePopupVC.gate = userInfo["gate"] as! String
            beaconBasePopupVC.carousel = userInfo["carousel"] as! String
            beaconBasePopupVC.schd = userInfo["schd"] as! String
            beaconBasePopupVC.schddttm = userInfo["schddttm"] as! String
            beaconBasePopupVC.estimate = userInfo["estimate"] as! String
            beaconBasePopupVC.zzzFlightPid = userInfo["zzzFlightPid"] as! String
            
            let completion = {
                if zoneCd == "ZDC" || zoneCd == "ZDD" || zoneCd == "ZAB" {
                    (self.window?.rootViewController as! TabBarController).selectedIndex = 2
                    
                    if zoneCd == "ZAB" {
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            NotificationCenter.default.post(name: NSNotification.Name("myPlanTabArr"), object: nil)
                        }
                    }
                }else if zoneCd == "ZZZ" {
                    
                    let movingTerminalTabVC = MovingTerminalTabViewController()
                    if terminalId == "P01" {
                        movingTerminalTabVC.terminalType = "T1"
                    }else {
                        movingTerminalTabVC.terminalType = "T2"
                    }
                    (self.window?.rootViewController as! TabBarController).selectedIndex = 1
                    ((self.window?.rootViewController as! TabBarController).viewControllers?[1] as! UINavigationController).pushViewController(movingTerminalTabVC, animated: false)
                    
                }else if zoneCd == "ZAT"{
                    let publicTransportVC = PublicTransportViewController()
                    if terminalId == "P01" {
                        publicTransportVC.terminalType = "T1"
                    }else {
                        publicTransportVC.terminalType = "T2"
                    }
                    
                    publicTransportVC.currentTap = 0
                    
                    (self.window?.rootViewController as! TabBarController).selectedIndex = 1
                    ((self.window?.rootViewController as! TabBarController).viewControllers?[1] as! UINavigationController).pushViewController(publicTransportVC, animated: false)
                    
                }
            }
            beaconBasePopupVC.completion = completion
            
            self.window?.rootViewController?.present(beaconBasePopupVC, animated: false, completion: nil)
            
        }
        
        
        completionHandler()
    }
}
// [END ios_10_message_handling]
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        UserDefaultsUtils.setPushId(fcmToken)
        //        UserDefaultsUtils.setDeviceId(fcmToken)
        UserDefaultsUtils.setDeviceId(UIDevice.current.identifierForVendor!.uuidString)
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
        print(messaging)
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Received data message: \(remoteMessage.appData)")
    }
}
