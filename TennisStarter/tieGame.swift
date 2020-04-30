//
//  tieGame.swift
//  TennisStarter
//
//  Created by Student on 28/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation

class tieGame: GameProtocol {
    private var playerOnePoint = 0
    private var playerTwoPoint = 0
    
    func gamePointsForPlayer1() -> Int {
          if playerOnePoint >= 6 && playerOnePoint > playerTwoPoint {
              return playerOnePoint - playerTwoPoint
          }
          return 0
      }
      
      func gamePointsForPlayer2() -> Int {
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
    
    func player1Score() -> String {
     
        
        return String(playerOnePoint)
    }
    
    func player2Score() -> String {
        
   
                  
                  return String(playerTwoPoint)
    }
    
    func player1Won() -> Bool{
           
           if playerOnePoint >= 7 && playerOnePoint - playerTwoPoint >= 2{
               return true
           }
           
           return false
           
       }
       
       func player2Won() -> Bool{
           if playerTwoPoint >= 7 && playerTwoPoint - playerOnePoint >= 2{
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




