//
//  reviewCollectionViewCell.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/19.
//

import UIKit
import SnapKit

class DetailPopUpCollectionViewCell: UICollectionViewCell {
    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.hongFont.indiBold
        label.numberOfLines = 1
        return label
    }()
    
    lazy var blogRivew:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
   
    
    
    //MARK: - Define Method

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func setView() {
        self.addSubview(titleLabel)
        self.addSubview(blogRivew)
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.PM.cellBorder.cgColor
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true

    }
    
    func constraint() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading).offset(18)
            make.trailing.equalTo(self.snp.trailing).offset(-18)
        }
        
        blogRivew.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(self.snp.leading).offset(18)
            make.trailing.equalTo(self.snp.trailing).offset(-18)
            make.bottom.equalToSuperview().inset(16)
        }
    }

    
}
