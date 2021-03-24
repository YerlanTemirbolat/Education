//
//  AppDelegate.swift
//  Registration
//
//  Created by Admin on 1/25/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: InitialViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}
