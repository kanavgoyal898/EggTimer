import UIKit
import AVFoundation



class ViewController: UIViewController {
    var timer = Timer()
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    var player : AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        var secondsPassed = 0
        let totalTime = eggTimes[hardness]! * 60
        
        progressBar.progress = 0.0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            self.progressBar.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed = secondsPassed + 1
            if secondsPassed > totalTime {
                timer.invalidate()
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
                self.titleLabel.text = "DONE!"
            }
        }
    }
    
}
