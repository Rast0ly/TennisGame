//
//  tieGame.swift
//  TennisStarter
//
//  Created by Student on 28/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation

class tieGame: GameProtocol {
    
    private var player1Points = 0
    private var player2Points = 0
    
    func gamePointsForPlayer1() -> Int {
        if player1Points >= 6 && player1Points > player2Points {
            return player1Points - player2Points
        }
        return 0
      }
      
      func gamePointsForPlayer2() -> Int {
        if player2Points >= 6 && player2Points > player1Points {
            return player2Points - player1Points
        }
        return 0
      }
    
    func addPointToPlayer1(){
        player1Points += 1
    }
    
    func addPointToPlayer2(){
        player2Points += 1
    }
    
    func player1Score() -> String {
        return String(player1Points)
    }
    
    func player2Score() -> String {
        return String(player2Points)
    }
    
    func player1Won() -> Bool{
        if player1Points >= 7 && player1Points - player2Points >= 2{
            return true
        }
        return false
    }
       
    func player2Won() -> Bool{
        if player2Points >= 7 && player2Points - player1Points >= 2{
            return true
        }
        return false
    }
    
    func complete() -> Bool {
        if player1Won(){
            return true
        }
        else if player2Won(){
            return true
        }
        
        return false
    }
}




