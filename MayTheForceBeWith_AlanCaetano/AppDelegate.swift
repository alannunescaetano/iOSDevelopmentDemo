//
//  AppDelegate.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 09/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let initialViewController = storyboard.instantiateViewController(withIdentifier: "masterVC")

        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()

        return true
    }
}

