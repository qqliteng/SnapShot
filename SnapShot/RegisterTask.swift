//
//  RegisterTask.swift
//  SnapShot
//
//  Created by Jacob Li on 20/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation


class RegisterTask: BaseTask, BaseTaskProtocol, HttpProtocol {
    
    
    override init(taskID: Int, taskUrl: String) {
        super.init(taskID: taskID, taskUrl: taskUrl)
    }
    
    func getSMSValidCode(phoneNum: String) {
        
        
        let signature = "POST\(self.taskUrl)phoneNum=\(phoneNum)time=\(ToolKit.getTimeStamp())\(SECRET_KEY)"
        let parametersDic:Dictionary<String, String> = ["phoneNum": phoneNum, "time": ToolKit.getTimeStamp()]
        
        let urlaAssembler = UrlAssembler(taskUrl: self.taskUrl, parameterDictionary: parametersDic, signiture: signature.md5)
    
        self.httpControl = HttpControl(delegate: self)
        
        self.httpControl.onRequest(urlaAssembler.url)
        self.httpControl.onRequestWithParams(self.taskUrl, param: Parameters(parameterDictionary: parametersDic, signiture: signature))
        
    }
    
    func doRegister(phoneNum: String, username: String, password: String, authCode: String) {
        
        let signature = "POST\(self.taskUrl)authCode=\(authCode)password=\(password)phoneNum=\(phoneNum)time=\(ToolKit.getTimeStamp())username=\(username)\(SECRET_KEY)"
        let parametersDic:Dictionary<String, String> = ["phoneNum": phoneNum, "time": ToolKit.getTimeStamp(),"username":username , "password": password, "authCode": authCode]
        
        let urlaAssembler = UrlAssembler(taskUrl: self.taskUrl, parameterDictionary: parametersDic, signiture: signature.md5)
        
        self.httpControl = HttpControl(delegate: self)
        
        self.httpControl.onRequest(urlaAssembler.url)

    
    }
    
    func didRecieveResults(results: AnyObject) {
        print(results)
        print("httpProtocol is called")
    }
    
    func didRecieveError(error: AnyObject) {
        print("httpProtocol is called")
    }
    
    func success(data: AnyObject) -> Dictionary<String, String> {
        let resultDictionary:Dictionary<String, String> = ["":""]
        return resultDictionary
    }
    
    func fail(error: AnyObject) {
        
    }
}