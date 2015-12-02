//
//  CouponViewController.swift
//  SnapShot
//
//  Created by RANRAN on 01/12/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class CouponViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var sectionNumber: Int?
    var couponTableView: UITableView?
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        self.title = "优惠活动"
        self.couponTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 1000), style: .Grouped)
        self.couponTableView?.backgroundColor = UIColor.brownColor()
        self.couponTableView?.delegate = self
        self.couponTableView?.dataSource = self
        self.view.addSubview(self.couponTableView!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    
    //==================UITableViewDataSource====================================================//
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        if indexPath.section == 0 {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "couponHeaderCell")
            cell?.frame = CGRect(x: 0, y: 44, width: SCREEN_WIDTH, height: 280)
            cell?.backgroundColor = UIColor.blueColor()
            let headerImageView = UIImageView(image: UIImage(named: "frontCellDefaultImage"))
            let couponLabel = UILabel(frame: CGRect(x: 40, y: 60, width: SCREEN_WIDTH - 80, height: 30))
            couponLabel.text = "邀请好友拿红包"
            cell?.addSubview(headerImageView)
            cell?.addSubview(couponLabel)
        } else {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "couponCell")
            cell?.frame = CGRect(x: 0, y: 300, width: SCREEN_WIDTH, height: 70)
            cell?.backgroundColor = UIColor.redColor()
            let couponImageView = UIImageView(image: UIImage(named: "couponImage"))
            cell?.addSubview(couponImageView)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    //==================UITableViewDelegate===========================================================//
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 280
        } else {
            return 70
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

}