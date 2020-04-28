//
//  tieGame.swift
//  TennisStarter
//
//  Created by Student on 28/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation

class tieGame {
    private var playerOnePoint = 0
    private var playerTwoPoint = 0
    
    func playerOne() -> Int {
          if playerOnePoint >= 6 && playerOnePoint > playerTwoPoint {
              return playerOnePoint - playerTwoPoint
          }
          return 0
      }
      
      func playerTwo() -> Int {
          if playerTwoPoint >= 6 && playerTwoPoint > playerOnePoint {
              return playerTwoPoint - playerOnePoint
          }
          return 0
      }
    func addPointToPlayer1(){
         playerOnePoint += 1
       }
       func addPointToPlayer2(){
           playerTwoPoint += 1
       }
    
    func playerOneScore() -> String {
        
        var score: String = "0"
              
        switch playerOnePoint {
            
        case 0 :
            score = "0"
        case 1:
            score = "15"
        case 2:
        score = "30"
        case 3:
        score = "40"
        case 4:
            score = "A"
        default:
            score = "40"
            
        }
        
        return score
    }
    
    func playerTwoScore() -> String {
        
      var score: String = "0"
                        
                  switch playerTwoPoint {
                  case 0:
                    score = "0"
                  case 1:
                      score = "15"
                  case 2:
                  score = "30"
                  case 3:
                  score = "40"
                  case 4:
                      score = "A"
                  default:
                      score = "40"
                      
                  }
                  
                  return score
    }
    
    func player1Won() -> Bool{
        
        if playerOnePoint >= 4 {
            return true
        }
        
        return false
        
    }
    
    func player2Won() -> Bool{
         if playerTwoPoint >= 4{
                   return true
               }
               
               return false
        
    }
    
    func complete() ->Bool {
        if player1Won(){
            return true
        }
        else if player2Won(){
            return true
        }
        
        return false
        
    }
    
}




