//
//  LoginViewContoller.swift
//  SnapShot
//
//  Created by RANRAN on 04/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var phoneWarningLabel: UILabel!
    
    @IBOutlet weak var passwordWarningLabel: UILabel!
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    var registerPushButton: UIButton!
    
    override func viewDidLoad() {
        self.phoneWarningLabel.hidden = true
        self.passwordWarningLabel.hidden = true
        self.phoneNumTextField.placeholder = "请输入电话号码"
        self.passwordTextField.secureTextEntry = true
        self.passwordTextField.placeholder = "请输入密码"
        self.checkBox.setImage(UIImage(named: "checkBoxImage"), forState: UIControlState.Normal)
        self.checkBox.setImage(UIImage(named: "checkBoxSelectedImage"), forState: UIControlState.Selected)
        self.title = "咔嚓"
        self.registerPushButton = ViewWidgest.addRightButton("注册")
        self.registerPushButton.addTarget(self, action: "registerPushButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController?.navigationBar.addSubview(self.registerPushButton)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.registerPushButton.removeFromSuperview()
    }
    
    @IBAction func loginButtonAction(sender: AnyObject) {
    }
    
    func registerPushButtonAction() {
        self.title = ""
        let registerViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("registerViewController") as? RegisterViewController
        self.navigationController?.pushViewController(registerViewController!, animated: true)
    }
    
    
   
}