//
//  NetworkRequest.swift
//  SnapShot
//
//  Created by Jacob Li on 19/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import Alamofire

class HttpControl {
    
    var delegate: HttpProtocol
    var taskID: Int?
    
    init(delegate:HttpProtocol, id:Int) {
        self.delegate = delegate
        self.taskID = id
    }
    
    /**
     接收一个网址，然后回调代理方法，回传数据
     - parameter url: 网址
     */
    
    func onRequest(url: String) {
        Alamofire.request(.GET, url)
            .responseJSON {response in
                self.delegate.didRecieveResults(response.result.value!)
        }
    }
    
    /**
     接收一个网址和参数，然后回调代理方法，回传数据
     - parameter url: 网址
     - parameter 参数:
     */
    func onRequestWithParams (url: String, param: Parameters) {
        Alamofire.Manager.sharedInstance.request(Method.GET, url, parameters:param.parametersDics, encoding:ParameterEncoding.JSON).responseJSON(options: NSJSONReadingOptions.MutableContainers){
            response -> Void in
            if let result:AnyObject = response.data {
                self.delegate.didRecieveResults(result)
            }
        }
    }
    
}

protocol HttpProtocol {
    func didRecieveResults(results:AnyObject)
}