//
//  ViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    
    var word = [String]()
    var wordFilter = [String]()
    var meaning = [String]()
    var grammar = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ZOTUNG DICTIONARY"
        tableView.delegate = self
        tableView.dataSource = self
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = false
        self.searchBar.layer.cornerRadius = 60
        self.searchBar.showsBookmarkButton = true
        loadDatas(sort: .assending)
    }
    
    func loadDatas(sort: sort){
        var count = 0
            for voca in sorting(Array: VOCABULARY, sortBy: sort) {
                count += 1
                self.word.append("\(count) " + voca.word)
                self.wordFilter.append(voca.word)
                self.meaning.append(voca.meaning)
                self.grammar.append(voca.grammar)
            }
    }
    
    @IBAction func sortButtonClicked(_ sender: Any) {
        word.removeAll()
        wordFilter.removeAll()
        meaning.removeAll()
        grammar.removeAll()
        if isDecended {
            loadDatas(sort: .decending)
            isDecended = false
            sortButton.title = "Asd"
        } else{
            loadDatas(sort: .assending)
            isDecended = true
            sortButton.title = "Dec"

        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return word.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.wordLabel.text = word[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let VC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        VC.WORD = word[indexPath.row] + " (" + grammar[indexPath.row] + ")"
        VC.MEANING = meaning[indexPath.row]
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension ViewController: UISearchBarDelegate, UITextFieldDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        word = wordFilter.filter({ (key) -> Bool in
            if !searchText.isEmpty {
                self.searchBar.showsBookmarkButton = true
                return key.uppercased().contains(searchText.uppercased())
            } else {
                return true
            }
        })
        tableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.searchBar.showsCancelButton = false
        self.searchBar.endEditing(true)
        self.searchBar.showsBookmarkButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        self.searchBar.showsBookmarkButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.searchBar.endEditing(true)
        self.searchBar.showsBookmarkButton = true
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        self.searchBar.showsBookmarkButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.showsBookmarkButton = false
    }
}
