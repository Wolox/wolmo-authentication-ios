//
//  AppDelegate.swift
//  AuthenticationDemo
//
//  Created by Daniela Riesgo on 3/16/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import Authentication

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var authenticationBootstrapper: AuthenticationBootstrapper<ExampleUser, ExampleSessionService>!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let exampleSessionService = ExampleSessionService(email: "example@mail.com", password: "password")
        
        let loginConfiguration = LoginViewConfiguration(logoImage: UIImage(named: "agregar_contacto"))
        let signupConfiguration = SignupViewConfiguration(usernameEnabled: true, passwordConfirmationEnabled: true,
                                                          termsAndServicesURL: NSURL(string: "https://www.hackingwithswift.com")!)
        let authenticationConfiguration = AuthenticationViewConfiguration(loginViewConfiguration: loginConfiguration, signupViewConfiguration: signupConfiguration)
        
        authenticationBootstrapper = AuthenticationBootstrapper(sessionService: exampleSessionService,
                                                                window: window!,
                                                                viewConfiguration: authenticationConfiguration) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewControllerWithIdentifier("ExampleMainViewController") as! ExampleMainViewController // swiftlint:disable:this force_cast
        }
        authenticationBootstrapper.bootstrap()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // swiftlint:disable line_length
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        // swiftlint:enable line_length
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // swiftlint:disable line_length
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        // swiftlint:enable line_length
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
