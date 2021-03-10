//
//  AppDelegate.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = WebSocketManager.shared
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        WebSocketManager.shared.disconnect()
    }
    
}

