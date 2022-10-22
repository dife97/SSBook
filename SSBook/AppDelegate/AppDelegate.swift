//
//  AppDelegate.swift
//  SSBook
//
//  Created by Diego Ferreira on 15/10/22.
//

import UIKit
import Apollo

let apolloClient = ApolloClient(url: URL(string: "https://us-central1-ss-devops.cloudfunctions.net/GraphQL")!)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

