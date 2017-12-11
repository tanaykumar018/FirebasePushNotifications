//
//  AppDelegate.swift
//  FirebasePushNotification
//
//  Created by Tanay Kumar on 12/9/17.
//  Copyright © 2017 Tanay Kumar Roy. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNService.shared.authorize()
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("did register for notifications")
        print(deviceToken.reduce(""){$0 + String(format: "%02X", $1)})
    }


}

