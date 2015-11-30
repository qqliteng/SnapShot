//
//  profileViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 23/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: BasicViewController {
    
    
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileUserIDLabel: UILabel!
    @IBOutlet weak var profileAppointLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    var profileBtn: UIButton = UIButton()
    var artsDisplayBtn: UIButton = UIButton()
    var commentDisplayBtn: UIButton = UIButton()
    var profileDetailTableView: ProfileDetailTableView?

    
    var artsImageArray: [String]!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
        
        let leftBtn: UIButton = UIButton(frame: CGRect(x: 20, y: 30, width: 30, height: 30))
        leftBtn.contentMode = UIViewContentMode.ScaleAspectFit
        leftBtn.setImage(UIImage(named: "backButtonImage"), forState: UIControlState.Normal)
        leftBtn.setImage(UIImage(named: "backButtonImage"), forState: UIControlState.Highlighted)
        
        self.profileImageView.addSubview(leftBtn)
        ViewWidgest.navigatiobBarButtomButton([self.profileBtn, self.artsDisplayBtn, self.commentDisplayBtn], titleArray: ["基本资料","作品展示","用户评论"], targetArrary: ["profileBtnAction","artsDisplayBtnAction","commentDisplayBtnAction"], view: self.view, yPosition: 227)
        leftBtn.addTarget(self, action: "pushView", forControlEvents: UIControlEvents.TouchUpInside)
        self.profileBtn.selected = true
        
        if self.profileBtn.selected == true {
            self.profileDetailTableView = ProfileDetailTableView(frame: CGRect(x: 0, y: 265, width: SCREEN_WIDTH, height: 500), style: UITableViewStyle.Grouped)
        }
        
        self.view.addSubview(self.profileDetailTableView!)
    }
    
    
    override func viewDidLoad() {
        self.artsImageArray = ["http://f.hiphotos.baidu.com/image/pic/item/574e9258d109b3de71ab648fc8bf6c81810a4cc5.jpg","http://c.hiphotos.baidu.com/image/pic/item/8326cffc1e178a82f3fcfe47f203738da877e811.jpg", "http://a.hiphotos.baidu.com/image/pic/item/adaf2edda3cc7cd94d3cb43e3d01213fb90e91c0.jpg","http://b.hiphotos.baidu.com/image/pic/item/f636afc379310a55f2505e13b34543a9832610e4.jpg"]
    
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func profileBtnAction() {
    
        
    }
    
    func artsDisplayBtnAction() {
    
    }
    
    func commentDisplayBtnAction() {
    
    
    }
//    //==================UITableViewDataSource====================================================//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell: UITableViewCell?
//        if indexPath.section == 0 {
//            cell = self.profileTableView.dequeueReusableCellWithIdentifier("valueCell") as! ValueCell
//            return cell!
//            
//        } else if indexPath.section == 1{
//            let detailCell: DetailCell?
//            detailCell = self.profileTableView.dequeueReusableCellWithIdentifier("detailCell") as? DetailCell
//            detailCell?.serviceCity.text = "北京、天津"
//            detailCell?.serviceCata.text = "情侣写真、 个人写真"
//            detailCell?.personIntro.text = "拍摄牛人，能力非常强"
//            return detailCell!
//        } else {
//            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "userInfoCell")
//            cell?.textLabel?.font = UIFont(name: HEITI, size: CONTENT_FONT_SIZE)
//            cell?.detailTextLabel?.font = UIFont(name: HEITI, size: CONTENT_FONT_SIZE)
//            cell?.detailTextLabel?.textColor = TEXT_COLOR_GREY
//            if indexPath.row == 0 {
//                cell?.textLabel?.text = "她的预约"
//                cell?.detailTextLabel?.text = "20"
//            } else if indexPath.row == 1{
//                cell?.textLabel?.text = "她的收藏"
//                cell?.detailTextLabel?.text = "48"
//            } else {
//                cell?.textLabel?.text = "她的点赞"
//                cell?.detailTextLabel?.text = "16"
//            }
//            return cell!
//        }
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 2 {
//            return 3
//        } else {
//            return 1
//        }
//    }
//    
//    //==================UITableViewDelegate===========================================================//
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 3
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return VALUE_CELL_HEIGHT
//        } else if indexPath.section == 1{
//            return SERVICE_CELL_HEIGHT
//        } else {
//            return USER_INFO_CELL_HEIGHT
//        }
//    }
//    
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        tableView.reloadData()
//    }
//    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }

    func pushView() {
        self.navigationController!.popToRootViewControllerAnimated(true)
    }

    
}