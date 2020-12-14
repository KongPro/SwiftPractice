//
//  KHomeViewController.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/8.
//

import UIKit
import  SnapKit

class KHomeViewController: UIViewController {

    lazy var tableView = UITableView(frame: CGRect.zero, style: .plain)
    
    lazy var dataArray : [KHomeModel] = [KHomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(KHomeCell.self, forCellReuseIdentifier: NSStringFromClass(KHomeCell.self))
        tableView.tableFooterView = UIView()
        view.backgroundColor = UIColor.red
        view.addSubview(tableView)

        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        initData()
    }
}

extension KHomeViewController {
    
    private func initData() {
        KDataCenter.shareInstance.getUserData(userID: "123") { (result, error) in
            guard let resultArr = result else{
                print("数据为空")
                return
            }
            
            guard let finalArr = resultArr as? [[String : AnyObject]] else { return }
            for d in finalArr {
                let model = KHomeModel(dict: d)
                dataArray.append(model)
            }
            tableView.reloadData()
        }
    }
    
}

extension KHomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(KHomeCell.self), for: indexPath) as! KHomeCell
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat( arc4random()%256)/255.0, alpha: 1.0)
        let model = dataArray[indexPath.item]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
}
