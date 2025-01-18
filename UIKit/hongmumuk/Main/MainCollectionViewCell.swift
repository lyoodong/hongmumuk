//
//  lCollectionViewCell.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/16.
//

import SnapKit
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .hongFont.Bold
        
        return label
        
    }()
    
    lazy var likeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(likeButtonTapped(_:)), for: .touchUpInside)
        button.isSelected = false
        
        return button
    }()
    
    lazy var logo:UIButton = {
        let view = UIButton()
    
        return view
    }()
    
    //MARK: - Properties
    var isLiked: Bool = false
    
    //MARK: - Define Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }

    
    //MARK: - Set Ui
    func setView() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(logo)
        self.layer.cornerRadius = 10
    }
    
    func constraint() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints { make in
            make.size.equalToSuperview()
            
        }
    }
    
    func setBackgroundColor(_ text:String) {
        
        switch text {
        case("한식"):
            backgroundColor = UIColor.PM.koreanBlue
        case("중식"):
            backgroundColor = UIColor.PM.chinaBlue
        case("일식"):
            backgroundColor = UIColor.PM.japanBlue
        case("양식"):
            backgroundColor = UIColor.PM.westBlue
        case("아시안"):
            backgroundColor = UIColor.PM.aisanBlue
        case("패·푸"):
            backgroundColor = UIColor.PM.fastBlue
        case("분식"):
            backgroundColor = UIColor.PM.schoolBlue
        case("기타"):
            backgroundColor = UIColor.PM.etcBlue
        default :
            backgroundColor = UIColor.white
            
        }
        
    }
    
    
}
