//
//  SegmentedControl.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 31/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class SegmentedControl: UISegmentedControl {
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    setTitleTextAttributes([
      NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.4)
      ], for: .normal)
    
    setTitleTextAttributes([
      NSAttributedStringKey.foregroundColor: UIColor.white
      ], for: .selected)
  }
  
  @IBInspectable var fontSize: CGFloat = 0.0 {
    didSet {
      if let color = titleTextAttributes(for: .normal)?[NSAttributedStringKey.foregroundColor] as? UIColor {
        setTitleTextAttributes([
          NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize, weight: .bold),
          NSAttributedStringKey.foregroundColor: color
          ], for: .normal)
      }
    }
  }
  
}
