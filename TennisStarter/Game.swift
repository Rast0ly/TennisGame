class Game: GameProtocol {
    
    var player1Points = 0
    var player2Points = 0
    
    func gamePointsForPlayer1() -> Int{
        if player1Points >= 3 {
            return player1Points - player2Points
        }
        return 0
    }
    
    func gamePointsForPlayer2() -> Int {
        if player2Points >= 3 {
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
        var score: String = "0"
        
        switch player1Points {
        case 0 :
            score = "0"
        case 1:
            score = "15"
        case 2:
            score = "30"
        case 3:
            score = "40"
         default:
            switch player1Points - player2Points{
            case -1, 0:
                score = "40"
            case 1:
                score =  "A"
            default:
                break
            }
        }
        
        return score
    }
    
    func player2Score() -> String {
        var score: String = "0"
        
        switch player2Points {
        case 0:
            score = "0"
        case 1:
            score = "15"
        case 2:
            score = "30"
        case 3:
            score = "40"
        default:
            switch player2Points - player1Points{
            case -1, 0:
                score = "40"
            case 1:
                score =  "A"
            default:
                break
            }
        }

        return score
    }

    func player1Won() -> Bool{
        if player1Points >= 4 && player1Points - player2Points >= 2 {
            return true
        }
        
        return false
        
    }
    
    func player2Won() -> Bool{
        if player2Points >= 4 && player2Points - player1Points >= 2 {
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

