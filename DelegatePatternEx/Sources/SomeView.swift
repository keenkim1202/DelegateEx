//
//  SomeView.swift
//  DelegatePatternEx
//
//  Created by KEEN on 2022/04/17.
//

import UIKit

protocol SomeDelegate: AnyObject {
  func startTask()
  func finishTask()
}

@IBDesignable
class SomeView: UIView {
  
  @IBOutlet weak var someLabel: UILabel!
  
  weak var delegate: SomeDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  func configure() {
    guard let view = self.loadViewFormNib(nibName: "SomeView") else { return }
    view.frame = bounds
    addSubview(view)
  }

  
  @IBAction func onStart(_ sender: UIButton) {
    delegate?.startTask()
  }
  
  @IBAction func onFinish(_ sender: UIButton) {
    delegate?.finishTask()
  }
  
}
