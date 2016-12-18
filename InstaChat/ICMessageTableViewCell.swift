//
//  ICMessageTableViewCell.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/18/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit

class ICMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
