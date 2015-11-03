//
//  SearchViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 30/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var SVsearchBar: UISearchBar?
    var locationBtn: UIButton?
    var cancelBtn: UIButton?
    var searchBtn: UIButton?
    var displayController: UISearchController?
    
    
    @IBOutlet weak var SVTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSearchBar()
        let nib = UINib(nibName: "CardCell", bundle: nil)
        if self.SVTableView != nil {
            SVTableView!.registerNib(nib, forCellReuseIdentifier: "cardCell")
            SVTableView!.delegate = self
            SVTableView!.dataSource = self
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        self.SVsearchBar?.removeFromSuperview()
        self.locationBtn?.removeFromSuperview()
        self.cancelBtn?.removeFromSuperview()
    }
    
    func initSearchBar() {
        self.navigationItem.hidesBackButton = true
        self.SVsearchBar = UISearchBar(frame: CGRect(x: 60, y: 0, width: Int(SCREEN_WIDTH - 120), height: 40))
        self.SVsearchBar?.placeholder = "搜索"
        
        self.SVsearchBar?.showsSearchResultsButton = true
        self.SVsearchBar?.delegate = self
        self.locationBtn = ViewWidgest.addLeftButton("北京")
        self.cancelBtn = ViewWidgest.addRightButton("取消")
        
        locationBtn!.addTarget(self, action: "locationBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
        cancelBtn!.addTarget(self, action: "cancelBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationController?.navigationBar.addSubview(self.SVsearchBar!)
        self.navigationController?.navigationBar.addSubview(self.locationBtn!)
        self.navigationController?.navigationBar.addSubview(self.cancelBtn!)
        
        self.displayController = UISearchController(searchResultsController: self)
        self.displayController?.delegate = self
    }
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.cancelBtn?.removeFromSuperview()
        self.searchBtn = ViewWidgest.addRightButton("搜索")
        self.searchBtn?.addTarget(self, action: "searchBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController?.navigationBar.addSubview(self.searchBtn!)
    }

    
    
    //---------------------UISearchBarDelegate-------------//
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    

    func locationBtnAction() {
    
    }
    
    func cancelBtnAction() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func searchBtnAction() {
        
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
    }
    
    //--------------------UITableViewDataSource-----------//
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return CGFloat(TABLE_CELL_HEIGHT)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        
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
    
    
    private func doReturnCell(row:Int) -> UITableViewCell {
        
        let cell = SVTableView.dequeueReusableCellWithIdentifier("cardCell") as! CardCell
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

}