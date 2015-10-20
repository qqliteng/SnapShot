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
    
    
    @IBOutlet weak var changeStatuesButton: UIButton!
    @IBOutlet weak var serviceCataButton: UIButton!
    @IBOutlet weak var userProfileButton: UIButton!
    @IBOutlet weak var groupAppointmentButton: UIButton!
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    var loginButton: UIButton?
    var registerButton: UIButton?
    
    var isLogin:Bool = false
    
    override func viewWillAppear(animated: Bool) {
        
        
        self.profileImage.image = UIImage(named: "profileImageDefault")
    }
    
    override func viewDidLoad() {
        self.initLeftViewController()
        self.view.backgroundColor = UIColor(red: 6/255, green: 191/255, blue: 141/255, alpha: 1)
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func initLeftViewController(){
        if isLogin == false {
            
            self.profileImage.hidden = true
            self.userIDLabel.hidden = true
            self.userIDLabel.hidden = true
            self.changeStatuesButton.hidden = true
            self.serviceCataButton.hidden = true
            self.userProfileButton.hidden = true
            self.groupAppointmentButton.hidden = true
            self.couponButton.hidden = true
            self.signatureLabel.hidden = true
            self.logoutButton.hidden = true
            self.settingButton.hidden = true
            self.aboutButton.hidden = true
            
            self.loginButton = UIButton(frame: CGRectMake(70, 300, 80, 40))
            self.loginButton?.layer.masksToBounds = true
            self.loginButton?.layer.cornerRadius = 5.0
            self.loginButton?.layer.borderWidth = 1.0
            self.loginButton?.layer.borderColor =  UIColor.whiteColor().CGColor
            self.loginButton?.setTitle("登陆", forState:  UIControlState.Normal)
            self.loginButton?.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(self.loginButton!)
            
            self.registerButton = UIButton(frame: CGRectMake(70, 400, 80, 40))
            self.registerButton?.layer.masksToBounds = true
            self.registerButton?.layer.cornerRadius = 5.0
            self.registerButton?.layer.borderWidth = 1.0
            self.registerButton?.layer.borderColor =  UIColor.whiteColor().CGColor
            self.registerButton?.setTitle("注册", forState:  UIControlState.Normal)
            self.registerButton?.addTarget(self, action: "register", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(self.registerButton!)
            
        } else {
            let alertView = UIAlertView(title: "登陆成功", message: "已经登录", delegate: self, cancelButtonTitle: "确定")
            alertView.show()
            
            self.loginButton?.hidden = true
            self.registerButton?.hidden = true
            self.profileImage.hidden = false
            self.userIDLabel.hidden = false
            self.userIDLabel.hidden = false
            self.changeStatuesButton.hidden = false
            self.serviceCataButton.hidden = false
            self.userProfileButton.hidden = false
            self.groupAppointmentButton.hidden = false
            self.couponButton.hidden = false
            self.signatureLabel.hidden = false
            self.logoutButton.hidden = false
            self.settingButton.hidden = false
            self.aboutButton.hidden = false
        }

    }
    
    func login() {
        print("login button is pressed!")
        self.isLogin = true
        self.initLeftViewController()
    }
    
    func register() {
        print("register button is pressed!")
    }
    
    @IBAction func changeStatusButton(sender: AnyObject) {
        print("changStatusButton button is pressed!")
    }
    
    @IBAction func serviceCataButton(sender: AnyObject) {
        print("changStatusButton button is pressed!")
    }
    
    @IBAction func userProfileButton(sender: AnyObject) {
        print("serviceCataButton button is pressed!")
    }
    
    
    @IBAction func groupAppointmentButton(sender: AnyObject) {
        print("groupAppointmentButton button is pressed!")
    }
    
    
    @IBAction func couponButton(sender: AnyObject) {
        print("couponButton button is pressed!")
    }

    @IBAction func logoutButton(sender: AnyObject) {
        self.isLogin = false
        self.initLeftViewController()
    }
    
}