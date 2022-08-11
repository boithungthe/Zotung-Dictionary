//
//  VocaViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit
import DropDown

class VocaViewController: UIViewController, UITableViewDelegate {
    private var topicEnglish = [String]()
    private var topicZotung = [String]()
    private var mainTopicArray = [mainTopic]()
    
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "Original",
            "Ascending",
            "Descending",
        ]
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.anchorView = tableView
        title = "Lessons"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        mainTopicArray = mainTopicChooser(Array: MAINTOPIC, sortBy: .original)
        menu.selectionAction = {index, title in
            if title == "Original" {
                self.mainTopicArray = mainTopicChooser(Array: MAINTOPIC, sortBy: .original)
            } else if title == "Ascending" {
                self.mainTopicArray = mainTopicChooser(Array: MAINTOPIC, sortBy: .assending)
            }else if title == "Descending" {
                self.mainTopicArray = mainTopicChooser(Array: MAINTOPIC, sortBy: .decending)
            }
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func sortButtonClicked(_ sander: Any) {
        menu.show()
    }
    
    private func didSelectMenuItem(named: String, array: [Vocabulary]) {
        topicSelectorForVocaDV(Array: array, sortBy: .original,VCTitle: named)
    }
    
    private func topicSelectorForVocaDV(Array: [Vocabulary], sortBy: sort,VCTitle: String) {
        //Detailviewcontroller only
        let VC = storyboard?.instantiateViewController(withIdentifier: "VocaDetailViewController") as! VocaDetailViewController
        VC.mainTopicArray.append(contentsOf: Array)
        VC.title = VCTitle
        navigationController?.pushViewController(VC, animated: true)
    }
}

extension VocaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTopicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VocaTableViewCell") as! VocaTableViewCell
        let topicEngishString = mainTopicArray[indexPath.row].topicEnglish
        cell.topicLabel.text = topicEngishString
        cell.zotungTopicLabel.text = mainTopicArray[indexPath.row].topicZotung
        
        if savedFavChecker(string: topicEngishString) == topicEngishString{
            cell.favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            cell.favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tabBarController?.tabBar.isHidden = true
        didSelectMenuItem(named: mainTopicArray[indexPath.row].topicEnglish,
                          array: mainTopicArray[indexPath.row].detailArray)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}
