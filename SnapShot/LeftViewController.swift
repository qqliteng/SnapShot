//
//  leftViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 10/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class LeftViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userIDLabel: UILabel!
    
    @IBOutlet weak var signatureLabel: UILabel!
    
    @IBAction func changStatusButton(sender: AnyObject) {
    }
    
    @IBAction func serviceCataButton(sender: AnyObject) {
    }
    
    @IBAction func userProfileButton(sender: AnyObject) {
    }
    
    
    @IBAction func groupAppointmentButton(sender: AnyObject) {
    }
    
    
    @IBAction func couponButton(sender: AnyObject) {
    }
    
    var isLogin:Bool = false
    
    override func viewWillAppear(animated: Bool) {
        
        self.profileImage.image = UIImage(named: "profileImageDefault")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 6/255, green: 191/255, blue: 141/255, alpha: 1)
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func initLeftViewController(){
        
    }
}