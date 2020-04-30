//
//  Set.swift
//  TennisStarter
//
//  Created by Student on 28/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation

class TennisSet {
    
    private var games = [GameProtocol]()
    
    var game: GameProtocol! {
        get {
            return games[games.count - 1]
        }
    }
    
    var Player1Won = 0
    var Player2Won = 0
    private var lead = 2
    private var totalWinsToWin = 6
    private var Player1Point = 0
    private var tieBrake = 0
    
    init(tieBrake: Int ) {
        games.append(Game())
        self.tieBrake = tieBrake
        
    }
    
    //Total up set wins
    func addPointToPlayer1() {
        game.addPointToPlayer1()
        if game.complete() {
            Player1Won += 1
            startNextGame()
           
        }
    }
    
    func addPointToPlayer2() {
        game.addPointToPlayer2()
        if game.complete() {
            Player2Won += 1
            startNextGame()
            
        }
    }
  
    func startNextGame() {
        if !gameEnd() {
            if isTiebraker() {
                games.append(tieGame())
            } else {
                games.append(Game())
            }
        }
    }
            
    func isPlayer1Winner() -> Bool {
        var Player1IsWinner = false
        if Player1Won >= totalWinsToWin && Player1Won - Player2Won >= lead{
            Player1IsWinner = true
        
        }
        return(Player1IsWinner)
    }
    
    func isPlayer2Winner() -> Bool {
        var Player2IsWinner = false
        if Player2Won >= totalWinsToWin && Player2Won - Player1Won >= lead{
            Player2IsWinner = true
        
        }
        return(Player2IsWinner)
    }
    
    func isTiebraker() -> Bool{
        
        return Player1Won == tieBrake && Player2Won == tieBrake
    }
    
    func gameEnd() -> Bool {
        return isPlayer2Winner() || isPlayer1Winner()
    }
    
    func Player1Advantage() -> Bool{
        return Player1Won >= totalWinsToWin - 1 && Player1Won > Player2Won
    }
    func Player2Advantage() -> Bool{
            return Player2Won >= totalWinsToWin - 1 && Player2Won > Player1Won
        }
    func playOneHasSetPoint() -> Bool{
        return game.gamePointsForPlayer1() > 0 && Player1Advantage()
    }
    
    func Player2HasSetPoint() -> Bool{
            return game.gamePointsForPlayer2() > 0 && Player2Advantage()
        
    }
}





