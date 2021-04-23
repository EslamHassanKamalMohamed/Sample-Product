//
//  AppDelegate.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/21/21.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{

    var window: UIWindow?
    
    lazy var realm = try! Realm()
    var Products: Results<ProductData>?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loadCategories()
        startTimer()
        return true
    }
    
    func startTimer() {
    _ = Timer.scheduledTimer(timeInterval: 259200, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    @objc
    func autoScroll() {
        try! realm.write {
          realm.deleteAll()
            loadCategories()
        }
    }
    
    func loadCategories() {
        Products = realm.objects(ProductData.self)
        print(Products as Any)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}


