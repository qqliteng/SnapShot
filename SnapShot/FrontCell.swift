//
//  FrontCell.swift
//  SnapShot
//
//  Created by Jacob Li on 03/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class FrontCell: UITableViewCell {
   
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var repostButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func likeButtonAction(sender: AnyObject) {
    }
    
    @IBAction func commentButtonAction(sender: AnyObject) {
    }
    @IBAction func repostButtonAction(sender: AnyObject) {
    }
}