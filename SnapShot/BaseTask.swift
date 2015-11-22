//
//  BaseTask.swift
//  SnapShot
//
//  Created by Jacob Li on 20/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import Alamofire

class BaseTask:NSObject {
    var taskID: Int!
    var taskUrl: String!
    var httpControl: HttpControl!
    init(taskID:Int, taskUrl: String) {
        super.init()
        self.taskID = taskID
        self.taskUrl = taskUrl
    }
}

protocol BaseTaskProtocol {
    func success(data:AnyObject) -> Dictionary<String, String>
    func fail(error:AnyObject)
}