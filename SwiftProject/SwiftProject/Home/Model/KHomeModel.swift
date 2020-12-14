//
//  HomeModel.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/14.
//

import UIKit

class KHomeModel: NSObject {

    @objc var userName : String?
    @objc var icon : String?
    @objc var text : String?
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override class func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
