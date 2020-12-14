//
//  HomeDataViewModel.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/14.
//

import UIKit

class KHomeDataViewModel : NSObject{
    
    var homeModel : KHomeModel?
    
    var iconUrl : URL?
    
    init(dict : [String : AnyObject]) {
        
        self.homeModel = KHomeModel(dict: dict)
        
        if let homeModel = self.homeModel {
            if let icon = homeModel.icon, !icon.isEmpty {
                iconUrl = URL(string: icon)
            }
        }
    }
}
