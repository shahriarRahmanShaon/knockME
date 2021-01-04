//
//  TableViewCell.swift
//  knockME
//
//  Created by sergio shaon on 30/12/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel.numberOfLines = 0
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.lineBreakMode = .byWordWrapping
        
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
