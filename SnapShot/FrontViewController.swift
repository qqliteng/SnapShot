//
//  ViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 09/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FrontViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SlideScrollViewDelegate {
    var navBtn: UIButton?
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        if self.navBtn == nil {
        self.navBtn = ViewWidgest.addLeftButton("navigationButtonImage", imageAfter: "navigationButtonImage")
        self.navBtn?.addTarget(AppDelegate(), action: "leftViewShowAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController?.navigationBar.addSubview(self.navBtn!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "咔嚓"
        let nib = UINib(nibName: "FrontCell", bundle: nil)
        mainTableView.registerNib(nib, forCellReuseIdentifier: "frontCell")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "popToSearchViewController")
    }

    override func viewWillDisappear(animated: Bool) {
        self.navBtn?.removeFromSuperview()
        self.navBtn = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  section == 0 {
            
            return 1
        }else {
            
            return 1
        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 44
        } else if indexPath.section == 0 && indexPath.row == 1 {
            return 200
        } else {
            return 300
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        var cataCell: CataCell?
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
            cell.backgroundColor = UIColor.clearColor()
            cell.contentView.backgroundColor = UIColor.clearColor()
            cell.clipsToBounds = true
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            cataCell = CataCell()
            cataCell?.cataLabel.text = "萌娃外拍"
            cataCell?.cataImageView.image = UIImage(named: "cataImageDefault")            
            return cataCell!

        } else {
            
            let tmp = tableView.dequeueReusableCellWithIdentifier("frontCell")
            
            if tmp == nil {
                cell = FrontCell(style: UITableViewCellStyle.Default, reuseIdentifier: "frontCell")
            } else {
                cell = tmp!
            }
            
            _ = cell as! FrontCell
            
            if indexPath.section == 0 {
                cell = doReturnCell(indexPath.row - 1)
            } else {
                cell = self.doReturnCell(indexPath.row)
            }
            return cell
        }
    }

    
    private func doRetureCataCell() -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCellWithIdentifier("cataCell") as! CataCell
        cell.cataLabel.text = "萌娃外拍"
        cell.cataImageView.image = UIImage(named: "cataImageDefault")
        return cell
    }
    
    private func doReturnCell(row:Int) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCellWithIdentifier("frontCell") as! FrontCell
        return cell
    }
    
    
    //=======================UITableViewDelegate 的实现===================================
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
                return 30
        }
        
        return CGFloat(SECTION_HEIGHT)
    }
    
    func SlideScrollViewDidClicked(index: Int) {
        print(index)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func popToSearchViewController() {
        
    }
}

