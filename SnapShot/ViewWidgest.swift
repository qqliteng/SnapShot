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
        let leftBtn: UIButton = UIButton(frame: CGRect(x: 7, y: 7, width: 30, height: 30))
        leftBtn.contentMode = UIViewContentMode.ScaleAspectFit
        leftBtn.setImage(UIImage(named: imageBefore), forState: UIControlState.Normal)
        leftBtn.setImage(UIImage(named: imageAfter), forState: UIControlState.Highlighted)
        return leftBtn
    }
    
    static func addLeftButton(buttonName:String) -> UIButton {
        let leftBtn: UIButton = UIButton(frame: CGRect(x: 2, y: 5, width: 60, height: 30))
        leftBtn.setTitle(buttonName, forState:  UIControlState.Normal)
        return leftBtn
    }
    
    static func addRightButton(imageBefore:String, imageAfter:String) -> UIButton {
        let rightBtn: UIButton = UIButton(frame: CGRect(x: Int(SCREEN_WIDTH - 48), y: 7, width: 30, height: 30))
        rightBtn.setImage(UIImage(named: imageBefore), forState: UIControlState.Normal)
        rightBtn.setImage(UIImage(named: imageAfter), forState: UIControlState.Highlighted)
        return rightBtn
    }
    
    static func addRightButton(buttonName:String) -> UIButton {
        let rightBtn: UIButton = UIButton(frame: CGRect(x: Int(SCREEN_WIDTH - 62), y: 7, width: 60, height: 30))
        rightBtn.setTitle(buttonName, forState: UIControlState.Normal)
        return rightBtn
    }
    
    static func backToRoot(navgationViewController: UINavigationController) {
        navgationViewController.popToRootViewControllerAnimated(true)
    }
    
    static func navigatiobBarButtomButton(ButtonArray:[UIButton], titleArray:[String], targetArrary:[Selector], navigationController:UINavigationController) {
        
        navigationController.navigationBar.frame = CGRectMake(0, 20, CGFloat(SCREEN_WIDTH), 83)
        
        // 画按钮
        for var i = 0; i < 3; i++ {
            ButtonArray[i].frame = CGRect(x: Double((SCREEN_WIDTH/3) * Float(i)), y: 44, width: Double(SCREEN_WIDTH/3), height: 40)
            ButtonArray[i].setTitle(titleArray[i], forState: UIControlState.Normal)
            ButtonArray[i].setTitleColor(TEXT_COLOR_GREY, forState: UIControlState.Normal)
            ButtonArray[i].setTitleColor(TEXT_COLOR_LIGHT_GREY, forState: UIControlState.Highlighted)
            ButtonArray[i].titleLabel?.font = UIFont.systemFontOfSize(14)
            ButtonArray[i].backgroundColor = UIColor.whiteColor()
            ButtonArray[i].addTarget(self, action: targetArrary[i], forControlEvents: UIControlEvents.TouchUpInside)
            navigationController.navigationBar.addSubview(ButtonArray[i])
            
        }
        
        // 画分割线
        for var i = 0; i < 2; i++ {
            let verticalShortLine: UIImageView = UIImageView(frame: CGRect(x: Double((SCREEN_WIDTH/3) * Float(i + 1)), y: 49, width: 0.5, height: 32))
            verticalShortLine.image = UIImage(named: "verticalLineImage")
            verticalShortLine.tag = 100+i
            navigationController.navigationBar.addSubview(verticalShortLine)
        }
    }
    
    static func recoverNavigationBar(viewsArrary:[UIView], navigationController:UINavigationController) {
        
        if viewsArrary.count > 0 {
            for view in viewsArrary {
                view.removeFromSuperview()
            }
        }
        
        if navigationController.isKindOfClass(UINavigationController) {
            navigationController.navigationBar.frame = CGRectMake(0, 20, CGFloat(SCREEN_WIDTH), 44)
            navigationController.navigationBar.viewWithTag(100)?.removeFromSuperview()
            navigationController.navigationBar.viewWithTag(101)?.removeFromSuperview()
        }
    }
}