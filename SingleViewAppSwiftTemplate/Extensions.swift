//
//  Extensions.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 02/06/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
  func convertToInt() -> Int? {
    guard let text = self else { return nil }
    return Int(text)
  }
}


extension Array {
  func randomItem() -> Element? {
    if isEmpty { return nil }
    let index = Int(arc4random_uniform(UInt32(self.count)))
    return self[index]
  }
}
