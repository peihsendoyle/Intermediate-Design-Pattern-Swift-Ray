//
//  Scorer.swift
//  DesignPatternsInSwift
//
//  Created by Hiep Nguyen on 2/25/16.
//  Copyright © 2016 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

protocol Scorer {
    
    var nextScorer: Scorer? { get set }
    
    func computeScoreIncrement<S: SequenceType where Turn == S.Generator.Element>(pastTurnsReversed: S) -> Int
}

class MatchScorer: Scorer {
    
    var nextScorer: Scorer? = nil
    
    func computeScoreIncrement<S : SequenceType where Turn == S.Generator.Element>(pastTurnsReversed: S) -> Int {
        
        var scoreIncrement: Int?
        
        for turn in pastTurnsReversed {
            
            if scoreIncrement == nil {
                
                scoreIncrement = turn.matched! ? 1 : -1
                
                break
            }
        }
        
        return (scoreIncrement ?? 0) + (nextScorer?.computeScoreIncrement(pastTurnsReversed) ?? 0)
    }
}

class StreakScorer: Scorer {
  
  var nextScorer: Scorer? = nil
  
  func computeScoreIncrement<S : SequenceType where Turn == S.Generator.Element>(pastTurnsReversed: S) -> Int {
    
    var streakLength = 0
    
    for turn in pastTurnsReversed {
      
      if turn.matched! {
        
        ++streakLength
      
      } else {
        
        break
      }
    }
    
    let streakBonus = streakLength >= 5 ? 10 : 0
    
    return streakBonus + (nextScorer?.computeScoreIncrement(pastTurnsReversed) ?? 0)
  }
}
