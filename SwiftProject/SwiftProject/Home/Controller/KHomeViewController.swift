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
    
    lazy var dataArray : [KHomeDataViewModel] = [KHomeDataViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        initData()
        
    }
}

extension KHomeViewController {
    
    private func setUpViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(KHomeCell.self, forCellReuseIdentifier: NSStringFromClass(KHomeCell.self))
        tableView.tableFooterView = UIView()
        view.backgroundColor = UIColor.red
        view.addSubview(tableView)

        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    private func initData() {
        
        KDataCenter.shareInstance.getUserData(userID: "123") { (result, error) in
            
            guard let resultArr = result else{ return }
            guard let finalArr = resultArr as? [[String : AnyObject]] else { return }
            
            for d in finalArr {
                let viewModel = KHomeDataViewModel(dict: d)
                dataArray.append(viewModel)
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
        let viewModel = dataArray[indexPath.item]
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65;
    }
}
