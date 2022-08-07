//
//  TableViewCell.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/6/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
