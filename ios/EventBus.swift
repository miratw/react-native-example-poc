//
//  EventBus.swift
//  MyTestApp
//
//  Created by Bruno Mazzo on 28/4/20.
//

import Foundation

@objc(EventBus)
public class EventBus: NSObject {
  
  @objc
  public func sendEvent(name: String, event: [String: Any]?) {
    print("Event name: \(name)")
  }
}
