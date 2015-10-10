//
//  ViewController.swift
//  SnapShot
//
//  Created by Jacob Li on 09/10/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FrontViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "http://api.openweathermap.org/data/2.5/forecast"
        let params = ["lat":39.0, "lon":41.0]
        print(params)
        
        Alamofire.request(.GET, url, parameters: params)
            .responseJSON { response in
                if(response.result.error != nil) {
                    print("Error: \(response.description)")
                    print(response.request)
                    print(response.response)
                    
                }
                else {
                    print("Success: \(url)")
                    print(response.request)
                    let json = JSON(response.result.value!)
                    print(json)
                }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

