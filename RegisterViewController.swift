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
        
        let sendSMSUrl = "POSThttp://111.13.47.169:8080/sms/authCode/sendphoneNum=13426198753time=1447917334486f4a8yoxG9F6b1gUB"
        let sig = sendSMSUrl.md5
        let parametersDic:Dictionary = ["phoneNum": "13426198753", "time": "1447917334486"]
        let sortedDic = parametersDic.sort({$0.0 < $1.0})
        print(sortedDic)
        
        var paraData: String = ""
        
        
        for (parameter, parameterValue) in sortedDic {
            print(parameter)
            paraData += "\(parameter)=\(parameterValue)&"
            print(paraData)
        }
        
        
        let url = VALID_NUM_URL + "?\(paraData)sig=\(sig!)"
        print(sig)
        
        Alamofire.request(.POST, VALID_NUM_URL, parameters: ["sendphoneNum": "13426198753", "time": "1447917334486", "sig": sig]).responseJSON() {
            respones in
            print(respones.result.value)
        }
        
        Alamofire.Manager.sharedInstance.request(.POST, url).responseJSON {
            response in
            if(response.result.error != nil) {
                print("Error: \(response.result.error)")
                print(response.request)
                print(response.response)
                
            }
            else {
                print("Success: \(sendSMSUrl)")
                print(response.request)
                print(response.result.value)
            }
        }
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
    }
}