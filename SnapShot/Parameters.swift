//
//  Parameters.swift
//  SaveMe
//
//  Created by Jacob Li on 31/07/2015.
//  Copyright (c) 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class Parameters {
    var parametersDic : Dictionary <String, String>?

    init (parameterDictionary: Dictionary<String, String>, signiture: String) {
        self.parametersDic = Dictionary()
        var sortedDic = parameterDictionary.sort{$0.0 < $1.0}
//        sortedDic = sortedDic.reverse()
            for (parameter, parameterValue) in sortedDic {
                print(parameter + "-" + parameterValue )
                self.parametersDic![parameter] = parameterValue
            }
        sortedDic.append(("sig", signiture))
        self.parametersDic!["sig"] = signiture
        print(self.parametersDic)
    }
}


