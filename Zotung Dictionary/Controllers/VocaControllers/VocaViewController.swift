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
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lessons"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    private func MainTopic() ->[mainTopic]{
       return mainTopicChooser(Array: MAINTOPIC, sortBy: .original)
    }
}

extension VocaViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainTopic().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VocaTableViewCell") as! VocaTableViewCell
        cell.topicLabel.text = MainTopic()[indexPath.row].topicEnglish
        cell.zotungTopicLabel.text = MainTopic()[indexPath.row].topicZotung
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectMenuItem(name: MainTopic()[indexPath.row].topicEnglish, array: MainTopic()[indexPath.row].detailArray)
    }

    func didSelectMenuItem(name: String, array: [Vocabulary]) {
        topicSelectorForVocaDV(Array: array, sortBy: .original,VCTitle: name)
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
