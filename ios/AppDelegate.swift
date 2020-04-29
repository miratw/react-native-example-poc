//
//  AppDelegate.swift
//  MyTestApp
//
//  Created by Bruno Mazzo on 27/4/20.
//

import UIKit
import FlipperKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  public var bridge: RCTBridge!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    #if DEBUG
    let client = FlipperClient.shared()
    let layoutDescriptorMapper = SKDescriptorMapper(defaults: ())
    
    // If you want to debug componentkit view in swift, otherwise you can omit the next line
    FlipperKitLayoutComponentKitSupport.setUpWith(layoutDescriptorMapper)
    client?.add(FlipperKitLayoutPlugin(rootNode: application, with: layoutDescriptorMapper!))
    client?.add(FlipperKitNetworkPlugin(networkAdapter: SKIOSNetworkAdapter()))
    client?.add(FKUserDefaultsPlugin.init(suiteName: nil))
    client?.add(FlipperKitReactPlugin())
    client?.start()
    #endif
    
    self.bridge = RCTBridge(delegate: self, launchOptions: launchOptions);
    #if RCT_DEV
    self.bridge.module(for: RCTDevLoadingView.self)
    #endif
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = NativeViewController()
    window.makeKeyAndVisible()
    self.window = window
    
    return true
  }
}

extension AppDelegate: RCTBridgeDelegate {
  func sourceURL(for bridge: RCTBridge!) -> URL! {
    #if DEBUG
    return RCTBundleURLProvider.sharedSettings()!.jsBundleURL(forBundleRoot: "src/index", fallbackResource: nil)
    #else
    return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
    #endif
  }
}
