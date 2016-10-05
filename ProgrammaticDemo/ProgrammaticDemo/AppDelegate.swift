//
//  AppDelegate.swift
//  ProgrammaticDemo
//
//  Created by Zach Zeleznick on 10/4/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.navigationBar.barTintColor = UIColor(rgb: 0x3e7aab)
        nav.navigationBar.tintColor = UIColor.white
        let navigationBarAppearace = UINavigationBar.appearance()
        let font = UIFont(name: "Helvetica-Bold", size: 16)
        if let font = font {
            navigationBarAppearace.titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.white];
        }
        let mainViewController = ViewController()
        nav.viewControllers = [mainViewController]
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }


}

