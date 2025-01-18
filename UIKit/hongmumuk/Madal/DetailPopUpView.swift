//
//  DetailPopUpView.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/17.
//

import UIKit
import SnapKit


class DetailPopUpView: UIScrollView {
    //MARK: - UI ProPerties
    lazy var restaurantLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    lazy var naverButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "naver"), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(naverButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var kakaoButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakao"), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(kakaoButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var appleButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "appleLogo"), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(appleButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    var location:(Double, Double) = (0, 0)
    
    //MARK: - Properties
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Set Ui
    private func SetView() {
        backgroundColor = .PM.detailBackground
        self.addSubview(restaurantLabel)
        self.addSubview(categoryLabel)
        self.addSubview(naverButton)
        self.addSubview(kakaoButton)
        self.addSubview(appleButton)
        
    }
    
    private func Constraint() {
        restaurantLabelConstraint()
        naverButtonConstraint()
        kakaoButtonConstraint()
        categoryLabelConstraint()
        appleButtonConstraint()
    }
    
    private func restaurantLabelConstraint () {
        restaurantLabel.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.top.equalToSuperview().offset(50)
        }
        
    }
    
    private func categoryLabelConstraint () {
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalTo(restaurantLabel.snp.trailing).offset(4)
            make.bottom.equalTo(restaurantLabel.snp.bottom)
        }
        
    }
    
    private func naverButtonConstraint() {
        naverButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(25)
            make.top.equalTo(categoryLabel.snp.bottom).offset(6)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(24)
            
        }
    }
    
    private func kakaoButtonConstraint() {
        kakaoButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(25)
            make.top.equalTo(categoryLabel.snp.bottom).offset(6)
            make.trailing.equalTo(naverButton.snp.leading)
            
        }
        
    }
    
    private func appleButtonConstraint() {
        appleButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(25)
            make.top.equalTo(categoryLabel.snp.bottom).offset(6)
            make.trailing.equalTo(kakaoButton.snp.leading)
            
        }
    }
    
    //MARK: - Define Method
    func openURL(_ url: URL?) {
        guard let url = url else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func naverButtonTapped(_ sender: UIButton) {
        if let restaurant = restaurantLabel.text {
            let url = getRestaurantLink(for: restaurant, platform: "naver")
            openURL(url)
        }
    }
    
    @objc func kakaoButtonTapped(_ sender: UIButton) {
        if let restaurant = restaurantLabel.text {
            let url = getRestaurantLink(for: restaurant, platform: "kakao")
            openURL(url)
            
        }
    }
    
    @objc func appleButtonTapped(_ sender: UIButton) {
        
        let lat: Double = location.0
        let lon: Double = location.1

        if let url = URL(string: "http://maps.apple.com/?ll=\(lat),\(lon)") {
        
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("유효하지 않은 URL입니다.")
        }
    }
    
    func configure(with restaurant: String) {
        restaurantLabel.text = restaurant
        
    }
    
}



