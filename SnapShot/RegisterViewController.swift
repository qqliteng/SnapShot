//
//  RegisterViewController.swift
//  SnapShot
//
//  Created by RANRAN on 04/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var SMSTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordValidTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        self.phoneNumTextField.placeholder = "请输入电话号码"
        self.SMSTextField.placeholder = "请输入短信验证码"
        self.passwordTextField.placeholder = "请输入密码"
        self.passwordValidTextField.placeholder = "请再次输入密码"
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var registerButtonAction: UIButton!
}