//
//  UIView++Extension.swift
//  DelegatePatternEx
//
//  Created by KEEN on 2022/04/18.
//

import UIKit

extension UIView {
  func loadViewFormNib(nibName: String) -> UIView? {
    let bundle = Bundle(for: SomeView.self)
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: self).first as? UIView
  }
}
