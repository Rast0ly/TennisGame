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
        return sets[sets.count - 1]
    }
    
    var previousSets: [TennisSet] {
        return Array(sets[0..<sets.count-1])
    }
    
    init() {
        sets.append(TennisSet(tieBrake: 6))
    }
    
    var player1SetsWon = 0
    var player2SetsWon = 0
    var winsRequired = 3
    
    func addPointToPlayer1() {
        set.addPointToPlayer1()
        if set.gameEnd(){
            player1SetsWon += 1
            nextSet()
        }
    }
    
    func addPointToPlayer2() {
        set.addPointToPlayer2()
        if set.gameEnd(){
            player2SetsWon += 1
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
    
    func hasPlayer1Won() -> Bool {
        return player1SetsWon == winsRequired
    }
    
    func hasPlayer2Won() -> Bool {
        return player2SetsWon == winsRequired
    }
    
    func isFinalSet() -> Bool {
        return player1SetsWon == winsRequired - 1
            && player2SetsWon == winsRequired - 1
    }
    
    func player1HasMatchPoint() -> Bool {
        return set.playOneHasSetPoint() && player1SetsWon == winsRequired - 1
    }
    
    func player2HasMatchPoint() -> Bool {
        return set.Player2HasSetPoint() && player2SetsWon == winsRequired - 1
    }
    
    func Player1Wins() -> Bool{
        var Player1wins = false
        if player1SetsWon == winsRequired{
            Player1wins = true
        }
        return (Player1wins)
        
    }

    func Player2Wins() -> Bool{
        var Player2wins = false
        if player2SetsWon == winsRequired{
            Player2wins = true
        }
        return (Player2wins)
    }
    
    func gameFinished() -> Bool{
        return Player1Wins() || Player2Wins()
    }
}














