//
//  CardCell.swift
//  SnapShot
//
//  Created by Jacob Li on 12/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class CardCell: UITableViewCell {
    
    
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var photographerIDLabel: UILabel!
    
    @IBOutlet weak var photographerPriceLabel: UILabel!
    
    
    @IBOutlet weak var servicesCataLabel: UILabel!
    
    
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}