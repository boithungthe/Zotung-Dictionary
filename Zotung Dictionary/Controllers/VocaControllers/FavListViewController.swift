//
//  FavListViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/10/22.
//

import UIKit

class FavListViewController: UIViewController, UITableViewDelegate {

    var mainTp = [mainTopic]()
    
    let noDataViewLabel: UILabel = {
        let label = UILabel()
        label.text = "No favorite list"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    @IBOutlet weak var clearButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite List"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
       
        view.addSubview(noDataViewLabel)
    }
    
    @IBAction func clearAllButtonClicked(_ sender: Any?) {
        let when = DispatchTime.now() + 0.03
        DispatchQueue.main.asyncAfter(deadline: when) {
            let alert = UIAlertController(title: "Clear all?", message: "Are you sure you want to clear the list", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            alert.addAction(UIAlertAction(title: "Clear", style: .destructive, handler: { action in
                for m in self.mainTp {
                    UserDefaults.standard.removeObject(forKey: m.topicEnglish)
                }
                self.noDataViewLabel.isHidden = false
                self.tableView.reloadData()
                self.clearButton.isEnabled = false
                confirmationAlert(title: "Cleared",message: "Favorite List is now empty",view: self, timer: 0.5)
            }))
            self.present(alert, animated: true)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var tArray = [mainTopic]()
        for t in TOPICMENUTITLE {
            for i in t.mainTopicArray {
                if i.topicEnglish == userDefaultsGetter(string: i.topicEnglish) {
                    tArray.append(i)
                }
            }
            favChooser(lesson: tArray, sort: .original)
        }
        if mainTp.isEmpty {
            self.clearButton.customView?.isHidden = true
            self.clearButton.isEnabled = false
            noDataViewLabel.isHidden = false
        } else {
            self.clearButton.customView?.isHidden = false
            self.clearButton.isEnabled = true
            noDataViewLabel.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .yellow
        noDataViewLabel.backgroundColor = .gray
        noDataViewLabel.frame = tableView.frame
    }
    
    func favChooser(lesson: [mainTopic],sort: sort) {
            mainTp.removeAll()
            mainTp.append(contentsOf: lesson)
        tableView.reloadData()
    }
}

extension FavListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTp.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavListTableViewCell") as! FavListTableViewCell
        if !mainTp.isEmpty {
        cell.topicEnglish.text = mainTp[indexPath.row].topicEnglish
        cell.topicZotung.text = mainTp[indexPath.row].topicZotung
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("select at :  \(indexPath.row)")
        let VC = storyboard?.instantiateViewController(withIdentifier: "VocaDetailViewController") as! VocaDetailViewController
        VC.favListViewButton.isEnabled = false
        VC.title = mainTp[indexPath.row].topicEnglish
        for i in TOPICMENUTITLE {
            for m in i.mainTopicArray {
                if m.topicEnglish.elementsEqual(VC.title!) {
                    VC.mainTopicArray = m.detailArray
                }
            }
        }
        navigationController?.pushViewController(VC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            let topic = self.mainTp[indexPath.row].topicEnglish
            let alert = UIAlertController(title: "Remove?", message: "Are you sure you want to remove \"\(topic)\" from the list?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                UserDefaults.standard.removeObject(forKey: self.mainTp[indexPath.row].topicEnglish)
                self.mainTp.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                confirmationAlert(title: "Removed", message: "\"\(topic)\" was removed",view: self , timer: 0.3)
                if self.mainTp.isEmpty {
                    self.clearButton.isEnabled = false
                    self.noDataViewLabel.isHidden = false
                }
            } ))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                tableView.reloadData()
            }))
            self.present(alert, animated: true)
        }
        
        tableView.reloadData()
        return UISwipeActionsConfiguration(actions: [delete])
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
