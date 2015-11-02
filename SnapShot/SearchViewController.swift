//
//  SearchViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 30/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var SVsearchBar: UISearchBar?
    var locationBtn: UIButton?
    var cancelBtn: UIButton?
    var searchBtn: UIButton?
    var displayController: UISearchController?
    var SVCollectionView: UICollectionView?
    
    override func viewWillAppear(animated: Bool) {
        self.initSearchBar()
        self.initCollectionView()
    }
    
    override func viewDidAppear(animated: Bool) {
        
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
        
        locationBtn!.addTarget(self, action: "LocationBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
        cancelBtn!.addTarget(self, action: "cancelBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationController?.navigationBar.addSubview(self.SVsearchBar!)
        self.navigationController?.navigationBar.addSubview(self.locationBtn!)
        self.navigationController?.navigationBar.addSubview(self.cancelBtn!)
        
        self.displayController = UISearchController(searchResultsController: self)
        self.displayController?.delegate = self
    }
    
    func initCollectionView() {
        let collectionViewLayout = UICollectionViewLayout()
        collectionViewLayout.layoutAttributesForElementsInRect(CGRect(x: 2, y: 2, width: 30, height: 30))
        self.SVCollectionView = UICollectionView(frame: CGRect(x: 0, y: 45, width: Int(SCREEN_WIDTH), height: Int(SCREEN_HEIGHT - 41)), collectionViewLayout: collectionViewLayout)
        self.SVCollectionView?.backgroundColor = UIColor.grayColor()
        self.SVCollectionView?.delegate = self
        self.view.addSubview(self.SVCollectionView!)

    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.cancelBtn?.removeFromSuperview()
        self.searchBtn = ViewWidgest.addRightButton("搜索")
        self.searchBtn?.addTarget(self, action: "SearchBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func LocationBtnAction() {
    
    }
    
    func cancelBtnAction() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func searchBtnAction() {
    
    }
    
    
    //------------------------------CollectionViewDelegate----------------------//
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = UICollectionViewCell(frame: CGRect(x: 2, y: 2, width: 30, height: 30))
        cell.backgroundColor = UIColor.redColor()
        let image: UIImageView = UIImageView(image: UIImage(named: "profileDefault"))
        cell.addSubview(image)
        return cell

    }
}