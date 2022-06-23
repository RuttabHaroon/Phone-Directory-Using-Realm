//
//  PhoneNumberListCell.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import UIKit

class PhoneNumberListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    var phoneNumber: PhoneNumber? {
        didSet {
            if let n = phoneNumber {
                self.nameLabel.text = n.name
                self.phoneLabel.text = n.phone
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
