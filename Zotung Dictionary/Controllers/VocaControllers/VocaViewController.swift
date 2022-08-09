//
//  VocaViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit

class VocaViewController: UIViewController, UITableViewDelegate {
    var topicEnglish = [String]()
    var topicZotung = [String]()
//    var topicDetailArray = [Vocabulary]()
    
    var english = [String]()
    var translation = [String]()
    var zotungSpeech = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lessons"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        for m in mainTopicChooser(Array: MAINTOPIC, sortBy: .original) {
            topicEnglish.append(m.topicEnglish)
            topicZotung.append(m.topicZotung)
            //topicDetailArray.append(contentsOf: m.detailArray)
        }
    }
}

extension VocaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicEnglish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VocaTableViewCell") as! VocaTableViewCell
        cell.topicLabel.text = topicEnglish[indexPath.row]
        cell.zotungTopicLabel.text = topicZotung[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        english.removeAll()
        translation.removeAll()
        let selectedItem = topicEnglish[indexPath.row]
        didSelectMenuItem(named: selectedItem,name: MAINTOPIC[indexPath.row].topicEnglish, array: MAINTOPIC[indexPath.row].detailArray)
    }

    func didSelectMenuItem(named: String, name: String, array: [Vocabulary]) {
        if named == name {
            topicSelectorForVocaDV(Array: array, sortBy: .original,VCTitle: named)
        }
    }
    
   private func topicSelectorForVocaDV(Array: [Vocabulary], sortBy: sort,VCTitle: String) {
       //Detailviewcontroller only
        let VC = storyboard?.instantiateViewController(withIdentifier: "VocaDetailViewController") as! VocaDetailViewController
        for tp in sortVocabulary(Array: Array, sortBy: sortBy) {
            VC.english.append(tp.english)
            VC.translation.append(tp.translation)
            VC.zotungSpeech.append(tp.zotungSpeech)
        }
        VC.title = VCTitle
        navigationController?.pushViewController(VC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}
