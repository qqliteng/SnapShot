//
//  ViewWidgest.swift
//  SnapShot
//
//  Created by Jacob Li on 28/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class ViewWidgest {
    static func addLeftButton(imageBefore:String, imageAfter:String) -> UIButton {
        let leftBtn: UIButton = UIButton(frame: CGRect(x: 10, y: 10, width: 60, height: 30))
        leftBtn.setImage(UIImage(named: imageBefore), forState: UIControlState.Normal)
        leftBtn.setImage(UIImage(named: imageAfter), forState: UIControlState.Highlighted)
        return leftBtn
    }
    
    static func addLeftButton(buttonName:String) -> UIButton {
        let leftBtn: UIButton = UIButton(frame: CGRect(x: 5, y: 10, width: 60, height: 30))
        leftBtn.setTitle(buttonName, forState:  UIControlState.Normal)
        return leftBtn
    }
    
    static func addRightButton(imageBefore:String, imageAfter:String) -> UIButton {
        let rightBtn: UIButton = UIButton(frame: CGRect(x: Int(SCREEN_WIDTH - 70), y: 10, width: 60, height: 30))
        rightBtn.setImage(UIImage(named: imageBefore), forState: UIControlState.Normal)
        rightBtn.setImage(UIImage(named: imageAfter), forState: UIControlState.Highlighted)
        return rightBtn
    }
    
    static func addRightButton(buttonName:String) -> UIButton {
        let rightBtn: UIButton = UIButton(frame: CGRect(x: Int(SCREEN_WIDTH - 65), y: 10, width: 60, height: 30))
        rightBtn.setTitle(buttonName, forState: UIControlState.Normal)
        return rightBtn
    }
    
}