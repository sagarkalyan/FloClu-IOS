//
//  TableCellTableViewCell.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-30.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit

class TableCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    

override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
}

}
