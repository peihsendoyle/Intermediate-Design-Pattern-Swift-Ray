//
//  TurnController.swift
//  DesignPatternsInSwift
//
//  Created by Hiep Nguyen on 2/25/16.
//  Copyright © 2016 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

class TurnController {
  
  private let shapeFactory: ShapeFactory
  
  private let shapeViewBuidler: ShapeViewBuilder
  
  var currentTurn: Turn?
  
  var pastTurn: [Turn] = [Turn]()
  
  init(shapeFactory: ShapeFactory, shapeViewBuidler: ShapeViewBuilder) {
    
    self.shapeFactory = shapeFactory
    
    self.shapeViewBuidler = shapeViewBuidler
  }
  
  func beginNewTurn() -> (ShapeView, ShapeView) {
    
    let shapes = shapeFactory.createShape()
    
    let shapeViews = shapeViewBuidler.buildShapeViewForShapes(shapes)
    
    currentTurn = Turn(shapes: [shapeViews.0.shape, shapeViews.1.shape])
    
    return shapeViews
  }
  
  func endTurnWithTappedShape(tappedShape: Shape) -> Int {
    
    currentTurn?.turnCompletedWithTappedShape(tappedShape)
    
    pastTurn.append(currentTurn!)
    
    let scoreIncrement = currentTurn!.matched! ? 1: -1
    
    return scoreIncrement
    
  }
}
