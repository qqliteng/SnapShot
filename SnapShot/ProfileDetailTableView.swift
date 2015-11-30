//
//  ProfileDetailTableView.swift
//  SnapShot
//
//  Created by Jacob Li on 30/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class ProfileDetailTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
       
        self.dataSource = self
        self.delegate = self
        self.contentSize = CGSize(width: SCREEN_WIDTH, height: 600)
        let nibValueCell = UINib(nibName: "ValueCell", bundle: nil)
        let nibDetailCell = UINib(nibName: "DetailCell", bundle: nil)
        self.registerNib(nibValueCell, forCellReuseIdentifier: "valueCell")
        self.registerNib(nibDetailCell, forCellReuseIdentifier: "detailCell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    //==================UITableViewDataSource====================================================//
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if indexPath.section == 0 {
            cell = self.dequeueReusableCellWithIdentifier("valueCell") as! ValueCell
            return cell!
            
        } else if indexPath.section == 1{
            let detailCell: DetailCell?
            detailCell = self.dequeueReusableCellWithIdentifier("detailCell") as? DetailCell
            detailCell?.serviceCity.text = "北京、天津"
            detailCell?.serviceCata.text = "情侣写真、 个人写真"
            detailCell?.personIntro.text = "拍摄牛人，能力非常强"
            return detailCell!
        } else if indexPath.section == 2{
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "userInfoCell")
            cell?.textLabel?.font = UIFont(name: HEITI, size: CONTENT_FONT_SIZE)
            cell?.detailTextLabel?.font = UIFont(name: HEITI, size: CONTENT_FONT_SIZE)
            cell?.detailTextLabel?.textColor = TEXT_COLOR_GREY
            if indexPath.row == 0 {
                cell?.textLabel?.text = "她的预约"
                cell?.detailTextLabel?.text = "20"
            } else if indexPath.row == 1{
                cell?.textLabel?.text = "她的收藏"
                cell?.detailTextLabel?.text = "48"
            } else {
                cell?.textLabel?.text = "她的点赞"
                cell?.detailTextLabel?.text = "16"
            }
            return cell!
        } else {
            cell = UITableViewCell()
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 3
        } else {
            return 1
        }
    }
    
    //==================UITableViewDelegate===========================================================//
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return VALUE_CELL_HEIGHT
        } else if indexPath.section == 1{
            return SERVICE_CELL_HEIGHT
        } else if indexPath.section == 2{
            return USER_INFO_CELL_HEIGHT
        } else {
            return 200
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
        if section == 2 {
            return 100
        } else {
            return 0
        }
    }
}