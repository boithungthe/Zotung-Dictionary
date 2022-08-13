//
//  FavListTableViewCell.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/10/22.
//

import UIKit

class FavListTableViewCell: UITableViewCell {

    @IBOutlet weak var topicEnglish: UILabel!
    @IBOutlet weak var topicZotung: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
