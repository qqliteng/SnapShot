//
//  BaseTask.swift
//  SnapShot
//
//  Created by Jacob Li on 20/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation

class BaseTask:NSObject {
    var taskID:Int!
    
    
    init(taskID:Int) {
        super.init()
        self.taskID = taskID
       
    }
}
