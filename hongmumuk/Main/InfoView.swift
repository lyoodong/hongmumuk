//
//  InfoView.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/09/01.
//

import UIKit
import SnapKit

class InfoView: UIView {
    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
        let view = UILabel()
        view.text = "Info"
        view.font = UIFont.hongFont.indiBold
        
        return view
    }()
    
    lazy var titleImage:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Logo")

        return view
    }()
    
    lazy var developerLabel:UILabel = {
        let view = UILabel()
        view.text = "iOS 류동완\nAndroid 최서영\nDesign 박세영"
        view.textAlignment = .center
        view.numberOfLines = 3
        
        return view
    }()
    
    lazy var githubButton:UIButton = {
        let view = UIButton()
        view.setTitle("Contact Us, Click here!", for: .normal)
        view.titleLabel?.font = .hongFont.indiBold
        view.setTitleColor(.black, for: .normal)
        
        return view
    }()
    
    
    lazy var versionLabel:UILabel = {
        let view = UILabel()
        view.text = "v1.1"
        view.textAlignment = .center
        view.textColor = .gray
        
        return view
    }()
    
    //MARK: - Define Method

    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        [titleLabel, titleImage, developerLabel, githubButton, versionLabel].forEach { view in
            addSubview(view)
        }
    }

    func Constraint() {
        
        let spacing:CGFloat = UIScreen.main.bounds.height * 0.15
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(spacing)
        }
        
        titleImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(spacing)
            make.size.equalTo(100)
            
        }
        
        developerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleImage.snp.bottom).offset(spacing / 2)
        }
        
        githubButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(developerLabel.snp.bottom).offset(spacing / 2)

        }
        
        versionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(githubButton.snp.bottom).offset(spacing / 2)

        }
        
    }

}
