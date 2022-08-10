//
//  VocaDetailViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit

class VocaDetailViewController: UIViewController, UITableViewDelegate {
    var mainTopicArray = [Vocabulary]()
    var dataSaved = [String: String]()
    let image = UIImageView()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.reloadData()
        
        let data = UserDefaults.standard.value(forKey: title!) as? String
        if data == title! {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
   
    @IBAction func favButtonClicked(_ sender: Any) {
        let data = UserDefaults.standard.value(forKey: title!) as? String
        if data == title {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            UserDefaults.standard.removeObject(forKey: title!)
        } else {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            UserDefaults.standard.set(title!, forKey: title!)
        }
    }
}

extension VocaDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTopicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VocaDetailTableViewCell") as! VocaDetailTableViewCell
        cell.englishLabel.text = mainTopicArray[indexPath.row].english
        cell.translationLabel.text = mainTopicArray[indexPath.row].translation
        cell.ztSpeechText = mainTopicArray[indexPath.row].zotungSpeech
        cell.englishSpeechText = mainTopicArray[indexPath.row].english
        return cell
    }
}
