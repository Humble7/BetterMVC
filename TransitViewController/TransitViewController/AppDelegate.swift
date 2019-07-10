//
//  AppDelegate.swift
//  TransitViewController
//
//  Created by 陈振 on 2019/7/9.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let coordinator = CoordinatorViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

