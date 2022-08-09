//
//  VocaDetailViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit

class VocaDetailViewController: UIViewController, UITableViewDelegate {
    var english = [String]()
    var translation = [String]()
    var zotungSpeech = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.reloadData()
    }
}

extension VocaDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return english.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VocaDetailTableViewCell") as! VocaDetailTableViewCell
        cell.englishLabel.text = english[indexPath.row]
        cell.translationLabel.text = translation[indexPath.row]
        cell.ztSpeechText = zotungSpeech[indexPath.row]
        cell.englishSpeechText = english[indexPath.row]
        return cell
    }
}
