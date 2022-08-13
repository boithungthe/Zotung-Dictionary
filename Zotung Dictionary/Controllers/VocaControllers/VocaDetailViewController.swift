//
//  VocaDetailViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit

class VocaDetailViewController: UIViewController, UITableViewDelegate {
    var mainTopicArray = [Vocabulary]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var favListViewButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.reloadData()
        viewWillAppear(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.reloadInputViews()
        
        let data = UserDefaults.standard.value(forKey: title!) as? String
        if data == title! {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func listViewButtonClicked(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "FavListViewController") as! FavListViewController
        navigationController?.pushViewController(VC, animated: true)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
//            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
//                cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
//            })
//
            cell.alpha = 0
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.05 * Double(indexPath.row),animations: {
                cell.alpha = 1
            })
        
    }
}
