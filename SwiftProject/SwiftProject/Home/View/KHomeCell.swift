//
//  KHomeCell.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/14.
//

import UIKit
import SnapKit

class KHomeCell: UITableViewCell {
    
    lazy var iconImageView = UIImageView()
    lazy var nameLbl = UILabel(title: "", fontSize: 16, textColor: UIColor.darkGray)
    lazy var textlbl = UILabel(title: "", fontSize: 12, textColor: UIColor.orange)
    
    var model : KHomeModel? {
        didSet{
            guard let model = model else { return }
            iconImageView.image = UIImage(named: "")
            nameLbl.text = model.userName
            textlbl.text = model.text
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    private func setUpUI() {
        iconImageView.backgroundColor = UIColor.lightGray
        iconImageView.layer.cornerRadius = 20
        nameLbl.textColor = UIColor.darkGray
        nameLbl.font = UIFont.systemFont(ofSize: 16)
        textlbl.textColor = UIColor.orange
        textlbl.font = UIFont.systemFont(ofSize: 12)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLbl)
        contentView.addSubview(textlbl)
        
        iconImageView .snp_makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.leading.equalTo(self.contentView).offset(15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        nameLbl.snp_makeConstraints { (make) in
            make.top.equalTo(self.iconImageView)
            make.leading.equalTo(self.iconImageView.snp_trailing).offset(8)
            make.trailing.equalTo(self.contentView).offset((-15))
        }
        
        textlbl.snp_makeConstraints { (make) in
            make.leading.equalTo(self.iconImageView.snp_trailing).offset(8)
            make.bottom.equalTo(self.iconImageView)
            make.trailing.equalTo(self.contentView).offset(-15)
        }
    }
}
