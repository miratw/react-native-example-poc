//
//  ReactNativeWrapperViewController.swift
//  MyTestApp
//
//  Created by Bruno Mazzo on 27/4/20.
//

import Foundation
import React

class ReactNativeWrapperViewController: UIViewController {
  
  let initParameters: [AnyHashable : Any]?
  
  init(initParameters: [AnyHashable : Any]? = nil) {
    self.initParameters = initParameters
    super.init(nibName: nil, bundle: nil)
    self.modalPresentationStyle = .fullScreen
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let rootView = RCTRootView(bridge: appDelegate.bridge, moduleName: "MyTestApp", initialProperties: self.initParameters)

    rootView.backgroundColor = UIColor.white
    
    self.view = rootView
  }
}
