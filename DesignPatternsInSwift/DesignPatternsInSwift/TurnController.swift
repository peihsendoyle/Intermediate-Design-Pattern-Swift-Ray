//
//  TurnController.swift
//  DesignPatternsInSwift
//
//  Created by Hiep Nguyen on 2/25/16.
//  Copyright © 2016 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

//Strategy Pattern

class TurnController {
  
  private let scorer: Scorer
  
  private let turnStrategy: TurnStrategy
  
  init(turnStrategy: TurnStrategy) {
    
    self.turnStrategy = turnStrategy
    
    self.scorer = MatchScorer()
    
    self.scorer.nextScorer = StreakScorer()
  }
  
  var currentTurn: Turn?
  
  var pastTurns: [Turn] = [Turn]()
  
  func beginNewTurn() -> (ShapeView, ShapeView) {
    
    let shapeViews = turnStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
    
    currentTurn = Turn(shapes: [shapeViews.0.shape, shapeViews.1.shape])
    
    return shapeViews
  }
  
  func endTurnWithTappedShape(tappedShape: Shape) -> Int {
    
    currentTurn?.turnCompletedWithTappedShape(tappedShape)
    
    pastTurns.append(currentTurn!)
    
    let scoreIncrement = scorer.computeScoreIncrement(pastTurns.reverse())
    
    return scoreIncrement
  }
}