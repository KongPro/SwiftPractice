//
//  BaseTabbarController.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/8.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: "RootControl.json", ofType: nil)
        
        guard let path = filePath else {
            return
        }
        
        guard let jsonData = try? NSData(contentsOfFile: path, options: .mappedRead) else {
            print("没有获取到json内容")
            return
        }
        
        guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else {
            print("Data转json失败")
            return
        }
        
        guard let dataArr = jsonObject as? [[String : AnyObject]] else {
            print("json数组不存在")
            return
        }
        
        print(dataArr)
        
        for dict in dataArr {
            
            guard let vcName = dict["vcName"] as? String else {
                continue
            }
            
            guard let title = dict["title"] as? String else {
                continue
            }
            
            guard let imageName = dict["imageName"] as? String else {
                continue
            }
            
            createChildVCWith(vcName: vcName, title: title, imageStr: imageName)
        }
    }
    
    private func createChildVCWith(vcName : String, title : String, imageStr : String) {
        
        
        guard let specName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有获取到项目名称")
            return
        }
        
        guard let className = NSClassFromString(specName + "." + vcName) else{
            print("控制器名称为空")
            return
        }
        
        guard let childClass = className as? UIViewController.Type else{
            print("没有获取到对应控制器")
            return
        }
        
        let childVC = childClass.init()
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: imageStr)
        addChild(UINavigationController(rootViewController: childVC))
    }

}
