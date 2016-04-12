//
//  ProgramTableViewCell.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 24/03/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var activity:Activity?
    
    @IBOutlet weak var Speaker: UIButton!
    @IBOutlet weak var SelectAction: UIButton!
    @IBOutlet weak var ViewAction: UIButton!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Schedule: UILabel!
    @IBOutlet weak var Place: UILabel!
    @IBOutlet weak var ActionBar: UIView!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
