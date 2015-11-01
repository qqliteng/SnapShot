//
//  SearchViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 30/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var SPSearchBar: UISearchBar!
    
    @IBOutlet weak var searchViewCollectionView: UICollectionView!
    
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidLoad() {
            
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    
    //---------------------UISearchBarDelegate-------------//
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
    }
}