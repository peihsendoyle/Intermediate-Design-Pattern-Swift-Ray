//
//  GameViewController.swift
//  DesignPatternsInSwift
//
//  Created by Joel Shapiro on 9/23/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  
  private var gameView: GameView { return view as! GameView }
  
  private var shapeViewFactory: ShapeViewFactory!
  
  private var shapeFactory: ShapeFactory!

  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    shapeViewFactory = SquareShapeViewFactory(size: gameView.sizeAvailableForShapes())
    
    shapeFactory = SquareShapeFactory(minProportion: 0.3, maxProportion: 0.8)
    
    beginNextTurn()
  }

  override func prefersStatusBarHidden() -> Bool {
    
    return true
  }

  private func beginNextTurn() {
    
    let shapes = shapeFactory.createShape()
    
    let shapeViews = shapeViewFactory.makeShapeViewsForShapes(shapes)

    shapeViews.0.tapHandler = {
    
      tappedView in
      
      let shape1 = shapes.0 as! SquareShape, shape2 = shapes.1 as! SquareShape
      
      self.gameView.score += shape1.sideLength >= shape2.sideLength ? 1 : -1
      
      self.beginNextTurn()
    }
    
    shapeViews.1.tapHandler = {
    
      tappedView in
      
      let shape1 = shapes.0 as! SquareShape, shape2 = shapes.1 as! SquareShape
      
      self.gameView.score += shape2.sideLength >= shape1.sideLength ? 1 : -1
      
      self.beginNextTurn()
    }

    gameView.addShapeViews(shapeViews)
  }
}