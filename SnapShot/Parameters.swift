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
    var parametersDics : Dictionary <String, String>?
    var parametersJSON:NSString?
    init (key: String, value: String) {
        parametersDics = ["\(key)" : value]
        let data = try? NSJSONSerialization.dataWithJSONObject(parametersDics!, options: NSJSONWritingOptions.PrettyPrinted)
        parametersJSON = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
    }
}

extension String  {
    var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.destroy()
        
        return String(format: hash as String)
    }
}
