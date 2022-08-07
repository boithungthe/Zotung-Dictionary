//
//  DetailViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var meaning: UILabel!
    var WORD = String()
    var MEANING = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        word.text = WORD
        meaning.text = MEANING
    }
}
