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

class FrontViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "CardCell", bundle: nil)
        mainTableView.registerNib(nib, forCellReuseIdentifier: "cardCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
            cell.backgroundColor = UIColor.clearColor()
            cell.contentView.backgroundColor = UIColor.clearColor()
            cell.clipsToBounds = true
            
            var slideRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: tableView.frame.width, height: CGFloat(IMAGE_HEIGHT)))
            
            var slideView = 
        }
    }

}

