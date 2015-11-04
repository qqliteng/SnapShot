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
    
    @IBOutlet weak var registerPushButton: UIButton!
    
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        self.title = "登陆"
        self.navigationController?.navigationBarHidden = true
    }
    @IBAction func loginButtonAction(sender: AnyObject) {
    }
    
    @IBAction func registerPushButtonAction(sender: AnyObject) {
    }
    
    
    @IBAction func closeButtonAction(sender: AnyObject) {
    }
}