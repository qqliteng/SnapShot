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

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "咔嚓"
        let nib = UINib(nibName: "CardCell", bundle: nil)
        mainTableView.registerNib(nib, forCellReuseIdentifier: "cardCell")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "popToSearchViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  section == 0 {
            
            return 1
        }else {
            
            return 2
        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return CGFloat(IN_WINDOW_HEIGHT)
        } else {
            return CGFloat(TABLE_CELL_HEIGHT)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
            cell.backgroundColor = UIColor.clearColor()
            cell.contentView.backgroundColor = UIColor.clearColor()
            cell.clipsToBounds = true
            
            let slideRect = CGRect(origin: CGPoint(x: 0, y: 60), size: CGSize(width: tableView.frame.width, height: CGFloat(IMAGE_HEIGHT)))
            
            let slideView = SlidScrollView (frame: slideRect)
            slideView.initWithFrameRect(slideRect)
            slideView.delegate = self
            
            cell.addSubview(slideView)
            
            return cell
        } else {
            
            let tmp = tableView.dequeueReusableCellWithIdentifier("cardCell")
            
            if tmp == nil {
                cell = CardCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cardCell")
            } else {
                cell = tmp!
            }
            
            _ = cell as! CardCell
            
            if indexPath.section == 0 {
                cell = doReturnCell(indexPath.row - 1)
            } else {
                cell = self.doReturnCell(indexPath.row)
            }
            return cell
        }
    }

    
    private func doReturnCell(row:Int) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCellWithIdentifier("cardCell") as! CardCell
        cell.photographerIDLabel.text = "XXXX"
        cell.photographerPriceLabel.text = "400"
        cell.displayImage.image = UIImage(named: "cellDefaultImage")
        
        return cell
    }
    
    
    //=======================UITableViewDelegate 的实现===================================
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
                return 0
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

