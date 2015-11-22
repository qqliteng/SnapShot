//
//  RegisterViewController.swift
//  SnapShot
//
//  Created by RANRAN on 04/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var SMSTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordValidTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var licenseCheckBox: UIButton!
    @IBOutlet weak var licenseDisplayButton: UIButton!
    @IBOutlet weak var sendSMSButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    private var timer:NSTimer?
    private var startCount = 60
    private var loginPushButton:UIButton?
    
    var phoneNum:String?
    var userName:String?
    var validCode:String?
    var password:String?
    
    override func viewDidLoad() {
        self.title = "咔嚓"
        self.userIDTextField.placeholder = "请输入昵称"
        self.phoneNumTextField.placeholder = "请输入电话号码"
        self.SMSTextField.placeholder = "请输入短信验证码"
        self.passwordTextField.secureTextEntry = true
        self.passwordTextField.placeholder = "请输入密码"
        self.passwordValidTextField.secureTextEntry = true
        self.passwordValidTextField.placeholder = "请再次输入密码"
        self.timeLabel.text = "获取验证码"
        self.loginPushButton = ViewWidgest.addRightButton("登录")
        self.loginPushButton?.addTarget(self, action: "pushToLoginViewController", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController?.navigationBar.addSubview(self.loginPushButton!)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.loginPushButton?.removeFromSuperview()
    }
    
    
    @IBAction func licenseCheckBoxAction(sender: AnyObject) {
    
    }
    @IBAction func licenseDisplayButtonAction(sender: AnyObject) {
    
    }
    
    @IBAction func sendSMSButtonAction(sender: AnyObject) {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countDown"), userInfo: nil, repeats: true)
        self.sendSMSButton.enabled = false
        
        let registerTask = RegisterTask(taskID: 01, taskUrl: AUTHENTICATION_CODE_URL)
        registerTask.getSMSValidCode("13811245934")
    }

    func countDown() {
        self.startCount--
        self.timeLabel.text = "请\(self.startCount)秒后重试"
        
        if self.startCount < 0 {
            if self.timer == nil {
                return
            }
            self.timeLabel.layer.removeAllAnimations()
            self.timeLabel.text = "请重新获取验证码"
            self.timer?.invalidate()
            self.timer = nil
            self.startCount = 60
        }
    }
    
    func pushToLoginViewController() {
        let loginViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("loginViewController")
        self.navigationController?.popToViewController(loginViewController, animated: true)
    }
    
    @IBAction func registerButtonAction(sender: AnyObject) {
        if phoneNumTextField.text != nil && userIDTextField.text != nil && self.SMSTextField.text != nil && passwordTextField != nil && passwordValidTextField.text != nil && passwordTextField.text == passwordValidTextField.text {
            self.phoneNum = phoneNumTextField.text
            self.userName = userIDTextField.text
            self.validCode = SMSTextField.text
            self.password = passwordTextField.text
        }
        
        let registerTask = RegisterTask(taskID: 02, taskUrl: REGISTER_URL)
        registerTask.doRegister(self.phoneNum!, username: self.userName!, password:self.password!, authCode: self.validCode!)
    }
}