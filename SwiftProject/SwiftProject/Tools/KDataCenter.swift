//
//  KDataCenter.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/14.
//

import UIKit

class KDataCenter: NSObject {

    static let shareInstance : KDataCenter = KDataCenter()
}

extension KDataCenter {
    
    func getUserData(userID : String, finished : (_ result : AnyObject?, _ error : NSError?) -> Void) {
        let filePath = Bundle.main.path(forResource: "data.json", ofType: nil)
        
        guard let path = filePath else { return }
        
        guard let jsonData = try? NSData(contentsOfFile: path, options: .mappedRead) else { return }

        guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableLeaves) else { return }
        finished(jsonObject as AnyObject , nil)
//        guard let array = jsonObject as [] else { return }
    }
    
}
