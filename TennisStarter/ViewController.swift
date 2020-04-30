import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var tennisMatch = Match()
    
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
        tennisMatch.addPointToPlayer1()
        
        updateScoreboard()
        if tennisMatch.gameFinished(){
            onMatchFinished(tennisMatch)
        }
    }
    
    @IBAction func p2AddPointPressed(_ sender: UIButton) {
          tennisMatch.addPointToPlayer2()
                
                updateScoreboard()
                if tennisMatch.gameFinished(){
                    onMatchFinished(tennisMatch)
                }
            }
    
    @IBAction func restartPressed(_ sender: AnyObject) {
        tennisMatch = Match()
        resetUI()
        
    }
    
    private func updateScoreboard() {
        p1PointsLabel.text = tennisMatch.set.game.player1Score()
        p2PointsLabel.text = tennisMatch.set.game.player2Score()
        p1GamesLabel.text = String(tennisMatch.set.Player1Won)
        p2GamesLabel.text = String(tennisMatch.set.Player2Won)
        p1SetsLabel.text = String(tennisMatch.player1SetsWon)
        p2SetsLabel.text = String(tennisMatch.player2SetsWon)
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
        
        for set in tennisMatch.previousSets {
            p1PreviousSetsLabel.text! += String(set.Player1Won) + " "
            p2PreviousSetsLabel.text! += String(set.Player2Won) + " "
        }
    }
    
    private func setEnablePlayerControls(_ enable: Bool) {
        p1Button.isEnabled = enable
        p2Button.isEnabled = enable
    }
    
    private func displayMatchWinnerAlert(match: Match) {
        let winnerName = match.hasPlayer1Won() ? p1NameLabel.text! : p2NameLabel.text!
        
        let alert = UIAlertController(title: "Winner", message: "\(winnerName) has won the match!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

