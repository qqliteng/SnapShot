//
//  ToolKit.swift
//  SnapShot
//
//  Created by RANRAN on 21/11/2015.
//  Copyright © 2015 Jacob Li. All rights reserved.
//

import Foundation
import UIKit

class ToolKit {
    static func getTimeStamp() -> String {
        var timeStamp = String(NSDate().timeIntervalSince1970)
        timeStamp.removeAtIndex(timeStamp.startIndex.advancedBy(10))
        timeStamp = timeStamp.substringToIndex(timeStamp.startIndex.advancedBy(13))
        return timeStamp
    }
    
    static func stringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = dfmatter.dateFromString(stringTime)
        
        let dateStamp:NSTimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        print(dateSt)
        return String(dateSt)
        
    }
    
    static func timeStampToString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:NSTimeInterval = string.doubleValue
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.stringFromDate(date))
        return dfmatter.stringFromDate(date)
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
