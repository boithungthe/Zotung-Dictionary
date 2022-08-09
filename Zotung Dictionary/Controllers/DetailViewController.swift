//
//  DetailViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/6/22.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController {

    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var meaning: UILabel!
    var WORD = String()
    var MEANING = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        word.text = WORD
        meaning.text = MEANING
    }
    @IBAction func speaker(_ sender: Any) {
       let speech = AVSpeechUtterance(string: "khae song saah")
        synthesizer.speak(speech)
        print("Talking")
    }
}
