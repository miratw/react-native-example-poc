//
//  NativeViewController.swift
//  MyTestApp
//
//  Created by Bruno Mazzo on 27/4/20.
//

import Foundation
import UIKit

public class NativeViewController: UIViewController {
  
  lazy var nativeText: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "This is a Swift Native View Controller"
    return label
  }()
  
  lazy var nameFieldTitle: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Name:"
    label.setContentHuggingPriority(.required, for: .horizontal)
    return label
  }()
  
  lazy var nameField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  lazy var sendNameToReactButton: UIButton = {
    let button = UIButton(type: .roundedRect)
    button.setTitle("Open React Native View", for: .normal)
    button.addTarget(self, action: #selector(openReactNativeViewWithName), for: .touchUpInside)
    button.setTitleColor(.blue, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var reactButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Open React Native View", for: .normal)
    button.addTarget(self, action: #selector(openReactNativeView), for: .touchUpInside)
    button.setTitleColor(.blue, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  public override func viewDidLoad() {
    self.view.addSubview(self.nativeText)
    self.view.topAnchor.constraint(equalTo: self.nativeText.topAnchor, constant: -32).isActive = true
    self.view.centerXAnchor.constraint(equalTo: self.nativeText.centerXAnchor).isActive = true
    
//    let stack = UIStackView(arrangedSubviews: [nameFieldTitle, nameField, sendNameToReactButton])
//    stack.axis = .horizontal
//    stack.translatesAutoresizingMaskIntoConstraints = false
//    self.view.addSubview(stack)
//    self.nativeText.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -32).isActive = true
//    self.view.leadingAnchor.constraint(equalTo: stack.leadingAnchor).isActive = true
//    self.view.trailingAnchor.constraint(equalTo: stack.trailingAnchor).isActive = true
    
    self.view.addSubview(self.reactButton)
    self.view.centerYAnchor.constraint(equalTo: self.reactButton.centerYAnchor).isActive = true
    self.view.centerXAnchor.constraint(equalTo: self.reactButton.centerXAnchor).isActive = true
    self.view.backgroundColor = .white
  }
  
  @objc
  func openReactNativeView() {
    let reactNativeViewController = ReactNativeWrapperViewController()
    self.present(reactNativeViewController, animated: true, completion: nil)
  }
  
  @objc
  func openReactNativeViewWithName() {
    guard let name = self.nameField.text else { return }
    
    let reactNativeViewController = ReactNativeWrapperViewController(initParameters: ["Name": name])
    self.present(reactNativeViewController, animated: true, completion: nil)
  }
}
