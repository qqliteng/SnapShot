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
    var navBtn: UIButton?
    var priceSortButton: UIButton?
    var distanceSortButton: UIButton?
    var dateSortButton: UIButton?
    var titleLabel: UILabel?
    
    override func viewDidLoad() {
        
        if self.navBtn == nil {
            self.navBtn = ViewWidgest.addLeftButton("navigationButtonImage", imageAfter: "navigationButtonImage")
            self.navBtn?.addTarget(AppDelegate(), action: "leftViewShowAction", forControlEvents: UIControlEvents.TouchUpInside)
            self.navigationController?.navigationBar.addSubview(self.navBtn!)
        }

        groupTableView.registerNib(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
        groupTableView.delegate = self
        groupTableView.dataSource = self
        titleLabel = UILabel(frame: CGRectMake(CGFloat(SCREEN_WIDTH/2 - Float(40)), 6, 80, 30))
        titleLabel?.text = "一起团拍"
        titleLabel?.tintColor = UIColor.whiteColor()
        self.titleLabel?.textColor = UIColor.whiteColor()
        titleLabel?.font = UIFont.systemFontOfSize(20)
        self.navigationController?.navigationBar.addSubview(titleLabel!)
        
        self.priceSortButton = UIButton()
        self.distanceSortButton = UIButton()
        self.dateSortButton = UIButton()
        ViewWidgest.navigatiobBarButtomButton([self.priceSortButton!,self.distanceSortButton!,self.dateSortButton!], titleArray: ["价格优先","距离优先","日期优先"], targetArrary: ["priceSortAction" , "distanceSortAction", "dateSortAction"], navigationController: self.navigationController!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        ViewWidgest.recoverNavigationBar([self.titleLabel!, self.priceSortButton!,self.distanceSortButton!,self.dateSortButton!], navigationController: self.navigationController!)
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
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //==================================Button Actions========================//
    func priceSortAction() {
        
    }
    
    func distanceSortACtion() {
    
    }
    
    func dateSortAction() {
    
    }
    
}