//
//  VocaTableViewCell.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import UIKit

class VocaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var zotungTopicLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    @IBAction func favButtonClicked(_ sender: Any) {
        if userDefaultsGetter(string: topicLabel.text!) == topicLabel.text {
            UserDefaults.standard.removeObject(forKey: topicLabel.text ?? "")
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            UserDefaults.standard.set(topicLabel.text!, forKey: topicLabel.text!)
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
