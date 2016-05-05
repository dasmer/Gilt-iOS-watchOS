//
//  AppDelegate.swift
//  Gilt
//
//  Created by Dasmer Singh on 4/30/16.
//  Copyright © 2016 Dasmer Singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = UINavigationController(rootViewController: SalesViewController())
        window.makeKeyAndVisible()

        self.window = window
        return true
    }

}

