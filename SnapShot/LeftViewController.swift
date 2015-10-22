//
//  leftViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 10/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class LeftViewController: UIViewController, UITextFieldDelegate {
    
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
    var userIDInputLabel:UILabel?
    var passwordLabel:UILabel?
    var userIDInputTextfield:UITextField?
    var passwordTextField:UITextField?
    var phoneNumLabel:UILabel?
    var phoneNumTextField:UITextField?
    
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
            self.loginButton?.addTarget(self, action: "loginViewDisplay", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(self.loginButton!)
            
            self.registerButton = UIButton(frame: CGRectMake(70, 400, 80, 40))
            self.registerButton?.layer.masksToBounds = true
            self.registerButton?.layer.cornerRadius = 5.0
            self.registerButton?.layer.borderWidth = 1.0
            self.registerButton?.layer.borderColor =  UIColor.whiteColor().CGColor
            self.registerButton?.setTitle("注册", forState:  UIControlState.Normal)
            self.registerButton?.addTarget(self, action: "registerViewDisplay", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(self.registerButton!)
            
        } else {
            self.loginButton?.hidden = true
            self.registerButton?.hidden = true
            self.userIDInputTextfield?.hidden = true
            self.userIDInputLabel?.hidden = true
            self.passwordTextField?.hidden = true
            self.passwordLabel?.hidden = true
            self.phoneNumLabel?.hidden = true
            self.phoneNumTextField?.hidden = true
            
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
    
    func loginViewDisplay() {
        print("login button is pressed!")
        self.loginButton?.center = CGPoint(x: 110, y: 200)
        self.userIDInputLabel = UILabel(frame: CGRectMake(10, 250, 70, 40))
        self.userIDInputLabel?.font = UIFont(name: "Heiti SC", size: 17)
        self.userIDInputLabel?.textColor = UIColor.whiteColor()
        self.userIDInputLabel?.text = "用户名"
        
        
        self.userIDInputTextfield = UITextField(frame: CGRectMake(70, 255, 130, 30))
        self.userIDInputTextfield?.borderStyle = UITextBorderStyle.RoundedRect
        self.userIDInputTextfield?.layer.masksToBounds = true
        self.userIDInputTextfield?.backgroundColor = UIColor.whiteColor()
        self.userIDInputTextfield?.layer.borderColor = UIColor.whiteColor().CGColor
        self.userIDInputTextfield?.placeholder = "请输入用户名"
        self.userIDInputTextfield?.returnKeyType = UIReturnKeyType.Done
        self.userIDInputTextfield?.clearButtonMode = UITextFieldViewMode.WhileEditing
        

        self.passwordLabel = UILabel(frame: CGRectMake(10, 300, 70, 40))
        self.passwordLabel?.font = UIFont(name: "Heiti SC", size: 17)
        self.passwordLabel?.textColor = UIColor.whiteColor()
        self.passwordLabel?.text = "密码"
        
        self.passwordTextField = UITextField(frame: CGRectMake(70, 305, 130, 30))
        self.passwordTextField?.secureTextEntry = true
        self.passwordTextField?.borderStyle = UITextBorderStyle.RoundedRect
        self.passwordTextField?.layer.masksToBounds = true
        self.passwordTextField?.backgroundColor = UIColor.whiteColor()
        self.passwordTextField?.layer.borderColor = UIColor.whiteColor().CGColor
        self.passwordTextField?.placeholder = "请输入密码"
        self.passwordTextField?.returnKeyType = UIReturnKeyType.Done
        self.passwordTextField?.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        self.view.addSubview(self.userIDInputLabel!)
        self.view.addSubview(self.userIDInputTextfield!)
        self.view.addSubview(self.passwordLabel!)
        self.view.addSubview(self.passwordTextField!)
 
        self.loginButton?.removeTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside)
        self.loginButton?.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.registerButton?.hidden = true
        

    }
    
    func login() {
        print(self.userIDInputTextfield?.text)
        print(self.passwordTextField?.text)
        let alertView = UIAlertView(title: "登陆成功", message: "已经登录:用户名：\(self.userIDInputTextfield?.text)======密码：\(self.passwordTextField?.text)", delegate: self, cancelButtonTitle: "确定")
        alertView.show()
        self.isLogin = true
        self.initLeftViewController()
    }
    
    func registerViewDisplay() {
        print("register button is pressed!")
        self.registerButton?.center = CGPoint(x: 110, y: 200)
        self.userIDInputLabel = UILabel(frame: CGRectMake(10, 250, 70, 40))
        self.userIDInputLabel?.font = UIFont(name: "Heiti SC", size: 17)
        self.userIDInputLabel?.textColor = UIColor.whiteColor()
        self.userIDInputLabel?.text = "用户名"
        
        
        self.userIDInputTextfield = UITextField(frame: CGRectMake(70, 255, 130, 30))
        self.userIDInputTextfield?.borderStyle = UITextBorderStyle.RoundedRect
        self.userIDInputTextfield?.layer.masksToBounds = true
        self.userIDInputTextfield?.backgroundColor = UIColor.whiteColor()
        self.userIDInputTextfield?.layer.borderColor = UIColor.whiteColor().CGColor
        self.userIDInputTextfield?.placeholder = "请输入用户名"
        self.userIDInputTextfield?.returnKeyType = UIReturnKeyType.Done
        self.userIDInputTextfield?.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        
        self.passwordLabel = UILabel(frame: CGRectMake(10, 300, 70, 40))
        self.passwordLabel?.font = UIFont(name: "Heiti SC", size: 17)
        self.passwordLabel?.textColor = UIColor.whiteColor()
        self.passwordLabel?.text = "密码"
        
        self.passwordTextField = UITextField(frame: CGRectMake(70, 305, 130, 30))
        self.passwordTextField?.secureTextEntry = true
        self.passwordTextField?.borderStyle = UITextBorderStyle.RoundedRect
        self.passwordTextField?.layer.masksToBounds = true
        self.passwordTextField?.backgroundColor = UIColor.whiteColor()
        self.passwordTextField?.layer.borderColor = UIColor.whiteColor().CGColor
        self.passwordTextField?.placeholder = "请输入密码"
        self.passwordTextField?.returnKeyType = UIReturnKeyType.Done
        self.passwordTextField?.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        self.phoneNumLabel = UILabel(frame: CGRectMake(10, 350, 70, 40))
        self.phoneNumLabel?.font = UIFont(name: "Heiti SC", size: 17)
        self.phoneNumLabel?.textColor = UIColor.whiteColor()
        self.phoneNumLabel?.text = "手机号"
        
        
        self.phoneNumTextField = UITextField(frame: CGRectMake(70, 355, 130, 30))
        self.phoneNumTextField?.borderStyle = UITextBorderStyle.RoundedRect
        self.phoneNumTextField?.layer.masksToBounds = true
        self.phoneNumTextField?.backgroundColor = UIColor.whiteColor()
        self.phoneNumTextField?.layer.borderColor = UIColor.whiteColor().CGColor
        self.phoneNumTextField?.placeholder = "请输入手机号"
        self.phoneNumTextField?.returnKeyType = UIReturnKeyType.Done
        self.phoneNumTextField?.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        self.view.addSubview(self.userIDInputLabel!)
        self.view.addSubview(self.userIDInputTextfield!)
        self.view.addSubview(self.passwordLabel!)
        self.view.addSubview(self.passwordTextField!)
        self.view.addSubview(self.phoneNumLabel!)
        self.view.addSubview(self.phoneNumTextField!)
        
        self.registerButton?.removeTarget(self, action: "register", forControlEvents: UIControlEvents.TouchUpInside)
        self.registerButton?.addTarget(self, action: "register", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.loginButton?.hidden = true

    }
    
    func register() {
        let alertView = UIAlertView(title: "登陆成功", message: "已经登录:用户名：\(self.userIDInputTextfield?.text)======密码：\(self.passwordTextField?.text)=======\(self.phoneNumTextField?.text)", delegate: self, cancelButtonTitle: "确定")
        alertView.show()
        self.isLogin = true
        self.initLeftViewController()
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
    
    //====================UITextFieldDelegate=================//
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)
        return true
    }
    
}