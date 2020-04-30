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
    
    var playerOneWon = 0
    var playerTwoWon = 0
    private var lead = 2
    private var totalWinsToWin = 6
    private var playerOnePoint = 0
    private var tieBrake = 0
    
    init(tieBrake: Int ) {
        games.append(Game())
        self.tieBrake = tieBrake
        
    }
    
    //Total up set wins
    func addPointToPlayerOne() {
        game.addPointToPlayer1()
        if game.complete() {
            playerOneWon += 1
            startNextGame()
           
        }
    }
    
    func addPointToPlayerTwo() {
        game.addPointToPlayer2()
        if game.complete() {
            playerTwoWon += 1
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
            
        func isPlayerOneWinner() -> Bool {
        var playerOneIsWinner = false
        if playerOneWon >= totalWinsToWin && playerOneWon - playerTwoWon >= lead{
            playerOneIsWinner = true
        
        }
        return(playerOneIsWinner)
    }
    
    func isPlayerTwoWinner() -> Bool {
           var playertwoIsWinner = false
           if playerTwoWon >= totalWinsToWin && playerTwoWon - playerOneWon >= lead{
               playertwoIsWinner = true
           
           }
        return(playertwoIsWinner)
       }
    
    func isTiebraker() -> Bool{
        
        return playerOneWon == tieBrake && playerTwoWon == tieBrake
    }
    
    func gameEnd() -> Bool {
        return isPlayerTwoWinner() || isPlayerOneWinner()
    }
    
    func playerOneAdvantage() -> Bool{
        return playerOneWon >= totalWinsToWin - 1 && playerOneWon > playerTwoWon
    }
    func playerTwoAdvantage() -> Bool{
            return playerTwoWon >= totalWinsToWin - 1 && playerTwoWon > playerOneWon
        }
    func playOneHasSetPoint() -> Bool{
        return game.gamePointsForPlayer1() > 0 && playerOneAdvantage()
    }
    
    func playerTwoHasSetPoint() -> Bool{
            return game.gamePointsForPlayer2() > 0 && playerTwoAdvantage()
        
    }
}





