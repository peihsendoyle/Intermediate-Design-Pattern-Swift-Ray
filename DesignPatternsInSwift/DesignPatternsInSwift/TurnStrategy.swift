//
//  TurnStrategy.swift
//  DesignPatternsInSwift
//
//  Created by Hiep Nguyen on 2/25/16.
//  Copyright © 2016 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

protocol TurnStrategy {
  
  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> (ShapeView, ShapeView)
}

class BasicTurnStrategy: TurnStrategy {
  
  let shapeFactory: ShapeFactory
  
  let shapeViewBuider: ShapeViewBuilder
  
  init(shapeFactory: ShapeFactory, shapeViewBuilder: ShapeViewBuilder) {
    
    self.shapeFactory = shapeFactory
    
    self.shapeViewBuider = shapeViewBuilder
  }
  
  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> (ShapeView, ShapeView) {
    
    return shapeViewBuider.buildShapeViewForShapes(shapeFactory.createShape())
    
  }
}

class RandomTurnStrategy: TurnStrategy {
  
  let firstStrategy : TurnStrategy
  
  let secondStrategy: TurnStrategy
  
  init(firstStrategy: TurnStrategy, secondStrategy: TurnStrategy) {
    
    self.firstStrategy = firstStrategy
    
    self.secondStrategy = secondStrategy
  }
  
  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> (ShapeView, ShapeView) {
    if Utils.randomBetweenLower(0.0, andUpper: 100.0) < 50.0 {
      
      return firstStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
      
    } else {
      
      return secondStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
    }
  }
}
