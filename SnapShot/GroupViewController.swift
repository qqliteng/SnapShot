//
//  GroupViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 11/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class GroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var groupTableView: UITableView!
    
    override func viewDidLoad() {
        self.title = "一起团拍"
        groupTableView.registerNib(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var groupCell: GroupCell?
        groupCell = groupTableView.dequeueReusableCellWithIdentifier("groupCell") as? GroupCell
        groupCell?.groupCellTimeLabel.text = "2015年11月6日14:00-18:00"
        groupCell?.groupCellLocationLabel.text = "北京奥林匹克森林公园"
        groupCell?.groupCellServiceLabel.text = ">60张拍摄，30张精修"
        groupCell?.groupCellMemberNumLabel.text = "3-5个家庭"
        groupCell?.groupCellPhotographerLabel.text = "2"
        return groupCell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
}