//
//  VocaViewController.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit
import DropDown
import SideMenu

class VocaViewController: UIViewController, UITableViewDelegate, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    
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
        confirmationAlert(title: "Welcome", message: "Welcome to Zotung English speaking app", view: self, timer: 2)
        
        title = "Lessons"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        MoreListMenu()
        //mainTopicArray = mainTopicChooser(Array: BASICLESSON, sortBy: .original)
        
    }
    func sortTopics(sort: sort) {
        
        for m in TOPICMENUTITLE {
            
            menu.selectionAction = {index, title in
                if title == "Original" {
                    self.mainTopicArray = mainTopicChooser(Array: m.mainTopicArray, sortBy: sort)
                } else if title == "Ascending" {
                    self.mainTopicArray = mainTopicChooser(Array: m.mainTopicArray, sortBy: sort)
                }else if title == "Descending" {
                    self.mainTopicArray = mainTopicChooser(Array: m.mainTopicArray, sortBy: sort)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func didSelectMenuItem(named: String) {
        title = named
        UserDefaults.standard.set(named, forKey: "lessonKey")
        self.dismiss(animated: true, completion: nil)
        for i in TOPICMENUTITLE {
            if named == i.topicTitle {
                mainTopicArray = i.mainTopicArray
                
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func didTapMenu() {
        present(sideMenu!, animated: true)
        print("more list tapped...")
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    func topTitles() -> [String] {
        var array = [String]()

        for i in TOPICMENUTITLE {
            array.append(i.topicTitle)
        }
        return array
    }
    
    func MoreListMenu() {
        let menu = moreListMenuController(with: topTitles())
        sideMenu = SideMenuNavigationController(rootViewController:  menu)
        menu.delegate = self
        sideMenu?.leftSide = true
        SideMenuManager.default.rightMenuNavigationController = .none
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        sideMenu?.navigationBar.prefersLargeTitles = true
        print("menu presenting")
    }
    
    @IBAction func listViewButtonClicked(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "FavListViewController") as! FavListViewController
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = UserDefaults.standard.value(forKey: "lessonKey") as! String
        
        for t in TOPICMENUTITLE {
            if data == t.topicTitle {
                mainTopicArray.removeAll()
                mainTopicArray = t.mainTopicArray
            }
        }
        tableView.reloadData()
        tabBarController?.tabBar.isHidden = false
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




protocol MenuControllerDelegate {
    func didSelectMenuItem(named: String)
}

class moreListMenuController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    public var delegate: MenuControllerDelegate?
    private let menuItems: [String]
    
    init(with menuItems: [String]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lessons"
        additionalSafeAreaInsets.top = 10
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "menuCell")
        tableView.backgroundColor = .systemGray
        tableView.reloadData()
        view.backgroundColor = .gray
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.layer.cornerRadius = 10
        let view = UIView()
        view.backgroundColor = UIColor.systemBrown
        cell.selectedBackgroundView = view
        if cell.textLabel?.text == "Basic lesson" {
            cell.backgroundColor = .purple
        } else if cell.textLabel?.text == "Level 1" {
            cell.backgroundColor = .orange
        }  else if cell.textLabel?.text == "New Songs" {
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
//
//        let seletedItem = self.menuItems[indexPath.row]
//        self.delegate?.didSelectMenuItem(named: seletedItem)
//        self.tableView.reloadData()
        
        let seletedItem = self.menuItems[indexPath.row]

        let alert = UIAlertController(title: "\(seletedItem )", message: "" , preferredStyle: .alert)
                alert.accessibilityFrame = CGRect(x: 0, y: 0, width: 30, height: 10)
                let when = DispatchTime.now() + 0.2
                DispatchQueue.main.asyncAfter(deadline: when){
                    // your code with delay
                    let seletedItem = self.menuItems[indexPath.row]
                    self.delegate?.didSelectMenuItem(named: seletedItem)
                    alert.dismiss(animated: true, completion: nil)
                    return
                }
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.isModalInPresentation = true
        
//        alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
//        alert.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 100, height: 50)
         self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override   func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
        })
        
        cell.alpha = 0
        UIView.animateKeyframes(withDuration: 0.2, delay: 0.05 * Double(indexPath.row),animations: {
            cell.alpha = 1
        })
    }
    override func tableView(_ tableView: UITableView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        tableView.transform = CGAffineTransform(translationX: tableView.frame.width, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0.05, animations: {
            tableView.transform = CGAffineTransform(translationX: tableView.frame.width, y: tableView.frame.height)
        })
    }
}
