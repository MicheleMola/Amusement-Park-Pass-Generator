//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct Pass {
  let entrant: Entrant
  var swipeTime: Date? = nil
  
  init(entrant: Entrant) {
    self.entrant = entrant
  }
}
