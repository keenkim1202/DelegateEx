//
//  ViewController.swift
//  DelegatePatternEx
//
//  Created by KEEN on 2022/04/17.
//

import UIKit

class ViewController: UIViewController {
   
  @IBOutlet weak var someView: SomeView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    someView.backgroundColor = .white
    someView.delegate = self
  }
}

extension ViewController: SomeDelegate {
  func startTask() {
    someView.someLabel.text = "some start task..."
    print("some start task...")
  }
  
  func finishTask() {
    someView.someLabel.text = "some finish task..."
    print("some finish task...")
  }
}
