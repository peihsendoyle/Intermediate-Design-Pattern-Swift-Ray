//
//  ShapeFactory.swift
//  DesignPatternsInSwift
//
//  Created by Hiep Nguyen on 2/24/16.
//  Copyright © 2016 RepublicOfApps, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol ShapeFactory {
  
  func createShape() -> (Shape, Shape)
}

class SquareShapeFactory: ShapeFactory {
  
  var minProportion: CGFloat
  
  var maxProportion: CGFloat
  
  init(minProportion: CGFloat, maxProportion: CGFloat) {
    
    self.minProportion = minProportion
    
    self.maxProportion = maxProportion
  }
  
  func createShape() -> (Shape, Shape) {
    
    let shape1 = SquareShape()
    
    shape1.sideLength = Utils.randomBetweenLower(minProportion, andUpper: maxProportion)
    
    let shape2 = SquareShape()
    
    shape2.sideLength = Utils.randomBetweenLower(minProportion, andUpper: maxProportion)
    
    return (shape1, shape2)
  }
}
