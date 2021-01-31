//
//  TableViewCell.swift
//  quizapp
//
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var attempLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
