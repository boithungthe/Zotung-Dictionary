//
//  VocaDetailTableViewCell.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit
import AVFoundation

class VocaDetailTableViewCell: UITableViewCell {
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var englishSpeaker: UIButton!
    @IBOutlet weak var ztSpeaker: UIButton!
    
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    var ztSpeechText = String()
    var englishSpeechText = String()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func englishSpeakerClicked(_ sender: Any) {
        let speech = AVSpeechUtterance(string: englishSpeechText)
        synthesizer.speak(speech)
        print("Talking")
    }
    @IBAction func ztSpeakerClicked(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: ztSpeechText)
        utterance.voice = AVSpeechSynthesisVoice(language: "sv-SE") // fi-FI any language that you prefer
        utterance.pitchMultiplier = 1
        utterance.rate = 0.6
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        print("Talking")
    }
    
}
