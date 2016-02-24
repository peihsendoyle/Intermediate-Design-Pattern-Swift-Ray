//
//  ShapeViewBuilder.swift
//  DesignPatternsInSwift
//
//  Created by Hiep Nguyen on 2/24/16.
//  Copyright © 2016 RepublicOfApps, LLC. All rights reserved.
//

import Foundation
import UIKit

class ShapeViewBuilder {
  
  private var shapeViewFactory: ShapeViewFactory
  
  var showFill = true
  
  var fillColor = UIColor.orangeColor()
  
  var showOutline = true
  
  var outlineColor = UIColor.grayColor()
  
  init(shapeViewFactory: ShapeViewFactory) {
    
    self.shapeViewFactory = shapeViewFactory
  }
  
  func buildShapeViewForShapes(shapes:(Shape, Shape)) -> (ShapeView, ShapeView) {
    
    let shapeViews = shapeViewFactory.makeShapeViewsForShapes(shapes)
    
    configureShapeView(shapeViews.0)
    
    configureShapeView(shapeViews.1)
    
    return shapeViews
  }
  
  private func configureShapeView(shapeView: ShapeView) {
    
    shapeView.showFill = showFill
    
    shapeView.fillColor = fillColor
    
    shapeView.showOutline = showOutline
    
    shapeView.outlineColor = outlineColor
  }
}
