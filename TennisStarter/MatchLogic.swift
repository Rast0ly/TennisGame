//
//  MatchLogic.swift
//  TennisStarter
//
//  Created by Student on 28/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation


class Match{
    
    var sets = [TennisSet]()
    
    
    var set: TennisSet! {
        get {
            
            return sets[sets.count - 1]
        }
    }
    
    var completedSets: [TennisSet] {
        return Array(sets[0..<sets.count-1])
    }
    
    
    init() {
        
        sets.append(TennisSet(tieBrake: 6))
           
    }
        
    
    
    var playerOneSetsWon = 0
    var playerTwoSetsWon = 0
    var winsRequired = 3
    
    
    
    func addPointToPlayerOne() {
        set.addPointToPlayerOne()
        if set.gameEnd(){
        playerOneSetsWon += 1
            nextSet()
        }
        
        
    }
    
    func addPointToPlayerTwo() {
        set.addPointToPlayerTwo()
        if set.gameEnd(){
        playerTwoSetsWon += 1
            nextSet()
        }
        
    }
    func nextSet() {
        
        if isFinalSet(){
            sets.append(TennisSet(tieBrake: 12))
        }
        else {
            sets.append(TennisSet(tieBrake: 6))
        }
        
    }
    

    
    func hasPlayerOneWon() -> Bool {
        return playerOneSetsWon == winsRequired
    }
    
    func hasPlayerTwoWon() -> Bool {
        return playerTwoSetsWon == winsRequired
    }
    
    func isFinalSet() -> Bool {
        return playerOneSetsWon == winsRequired - 1
            && playerTwoSetsWon == winsRequired - 1
    }
    
    func player1HasMatchPoint() -> Bool {
        return set.playOneHasSetPoint() && playerOneSetsWon == winsRequired - 1
    }
    
    func player2HasMatchPoint() -> Bool {
        return set.playerTwoHasSetPoint() && playerTwoSetsWon == winsRequired - 1
    }
    
    func playerOneWins() -> Bool{
        var playerOnewins = false
        if playerOneSetsWon == winsRequired{
            playerOnewins = true
        }
        return (playerOnewins)
        
    }
    func playerTwoWins() -> Bool{
         var playerTwowins = false
         if playerTwoSetsWon == winsRequired{
             playerTwowins = true
         }
         return (playerTwowins)
         
     }
    
    
    func gameFinished() -> Bool{
        
        return playerOneWins() || playerTwoWins()
        
    }
    
}














