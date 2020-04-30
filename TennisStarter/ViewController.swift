import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var tennisGame = Match()
    
    private func updateScoreboard() {
        p1PointsLabel.text = tennisGame.set.game.player1Score()
          p2PointsLabel.text = tennisGame.set.game.player2Score()
          p1GamesLabel.text = String(tennisGame.set.playerOneWon)
          p2GamesLabel.text = String(tennisGame.set.playerTwoWon)
          p1SetsLabel.text = String(tennisGame.playerOneSetsWon)
          p2SetsLabel.text = String(tennisGame.playerTwoSetsWon)
      }
    private func onMatchFinished(_ match: Match) {
        setEnablePlayerControls(false)
        displayMatchWinnerAlert(match: match)
    }
    
    private func updateUI() {
        updateScoreboard()
        updatePreviousSetScores()
        
    }
    
  private func resetUI() {
        updateScoreboard()
        updatePreviousSetScores()
        setEnablePlayerControls(true)
        
    }
    
    
 
    
    private func updatePreviousSetScores() {
        p1PreviousSetsLabel.text = ""
        p2PreviousSetsLabel.text = ""
        
        for set in tennisGame.completedSets {
            p1PreviousSetsLabel.text! += String(set.playerOneWon) + " "
            p2PreviousSetsLabel.text! += String(set.playerTwoWon) + " "
        }
    }
    
    private func setEnablePlayerControls(_ enable: Bool) {
        p1Button.isEnabled = enable
        p2Button.isEnabled = enable
    }
    
    private func displayMatchWinnerAlert(match: Match) {
        let winnerName = match.hasPlayerOneWon() ? p1NameLabel.text! : p2NameLabel.text!
        
        let alert = UIAlertController(title: "Winner", message: "\(winnerName) has won the match!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var p1Button: UIButton!
    @IBOutlet weak var p2Button: UIButton!
    @IBOutlet weak var p1NameLabel: UILabel!
    @IBOutlet weak var p2NameLabel: UILabel!
    
    @IBOutlet weak var p1PointsLabel: UILabel!
    @IBOutlet weak var p2PointsLabel: UILabel!
    
    @IBOutlet weak var p1GamesLabel: UILabel!
    @IBOutlet weak var p2GamesLabel: UILabel!
    
    @IBOutlet weak var p1SetsLabel: UILabel!
    @IBOutlet weak var p2SetsLabel: UILabel!
    
    @IBOutlet weak var p1PreviousSetsLabel: UILabel!
    @IBOutlet weak var p2PreviousSetsLabel: UILabel!
   
    
    

    
    /********Methods*********/
    @IBAction func p1AddPointPressed(_ sender: UIButton) {
        tennisGame.addPointToPlayerOne()
        
        updateScoreboard()
        if tennisGame.gameFinished(){
            onMatchFinished(tennisGame)
        }
    }
    
    @IBAction func p2AddPointPressed(_ sender: UIButton) {
          tennisGame.addPointToPlayerTwo()
                
                updateScoreboard()
                if tennisGame.gameFinished(){
                    onMatchFinished(tennisGame)
                }
            }
    
    @IBAction func restartPressed(_ sender: AnyObject) {
        tennisGame = Match()
        resetUI()
        
    }
    
    
}

