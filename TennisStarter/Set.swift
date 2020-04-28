//
//  Set.swift
//  TennisStarter
//
//  Created by Student on 28/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation

class TennisSet {

    
    private var games = [Game]()
    
    var game: Game! {
        get {
            return games[games.count - 1]
        }
    }
    
    private var playerOneWon = 0
    private var playerTwoWon = 0
    private var lead = 2
    private var totalWinsToWin = 6
    private var playerOnePoint = 0
    
    
    //Total up set wins
    func addPointToPlayerOne() {
        game.addPointToPlayer1()
        if game.complete() {
            playerOneWon += 1
           
        }
    }
    
    func addPointToPlayerTwo() {
        game.addPointToPlayer2()
        if game.complete() {
            playerTwoWon += 1
            
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
        let tieBrakerCondtion = 6
        return playerOneWon == tieBrakerCondtion && playerTwoWon == tieBrakerCondtion
    }
    
    func gameEnd() -> Bool {
        return isPlayerTwoWinner() || isPlayerOneWinner()
    }
    
    func playerOneAdvantage(playerOneWon: Int, playerTwoWon: Int) -> Bool{
        return playerOneWon >= totalWinsToWin - 1 && playerOneWon > playerTwoWon
    }
    func playerTwoAdvantage(playerOneWon: Int, playerTwoWon: Int) -> Bool{
            return playerTwoWon >= totalWinsToWin - 1 && playerTwoWon > playerOneWon
        }
    
    func playerOneWinsSet() -> Bool{
        if playerOneAdvantage && isPlayerOneWinner() || isTiebraker() && isPlayerOneWinner(){
            
        }
        return game.gamePointsForPlayer1()
    }
    
        
    }





