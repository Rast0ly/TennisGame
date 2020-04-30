//
//  GameProtocol.swift
//  TennisStarter
//
//  Created by Student on 29/04/2020.
//  Copyright © 2020 University of Chester. All rights reserved.
//

import Foundation

protocol GameProtocol : class {
    
    func gamePointsForPlayer1() -> Int
    func gamePointsForPlayer2() -> Int
    
    func addPointToPlayer1()
    func addPointToPlayer2()

    func player1Score() -> String
    func player2Score() -> String
    
    func player1Won() -> Bool
    func player2Won() -> Bool
    func complete() -> Bool
}
