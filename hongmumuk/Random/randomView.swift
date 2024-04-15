//
//  randomView.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import UIKit
import SnapKit


class randomView: UIView {
    //MARK: - UI ProPerties
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "랜덤 선택"
        label.font = UIFont.hongFont.Bold
        label.textColor = .black
        
        return label
    }()
    
    public var name:String = "랜덤 버튼을 클릭해주세요!"
    
    lazy var randomRestaurant:UIButton = {
        let button = UIButton()
        button.setTitle("\(name)", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.hongFont.indiBold
        button.backgroundColor = .PM.detailBackground
        button.isHidden = true
        
        return button
        
    }()
    
    
    
    lazy var randomButton:UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 돌리기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.hongFont.indiBold
        button.addTarget(self, action: #selector(randomButtonTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        return button
    }()
    
//    var gifAnimationView: GIFImageView = {
//        let image = GIFImageView()
//
//        return image
//    }()
    
    var location: (Double, Double)?
    
    var category: String?
    
    
    //MARK: - Define Method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
//        playGifVideo()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func randomButtonTapped(_ sender: UIButton) {
        guard let randomCategory = Data.shared.getRandomCategory() else { return }
        guard let randomRest = Data.shared.getRandomRestaurant(randomCategory: randomCategory) else { return }
        
        randomRestaurant.isHidden = false
        category = randomCategory.name.rawValue
        name = randomRest.name
        location = randomRest.location
        
        randomRestaurant.setTitle("\(name)", for: .normal)
    }
    
    
//    private func playGifVideo() {
//        DispatchQueue.main.async { [weak self] in
//            self?.gifAnimationView.animate(withGIFNamed: "random.gif", loopCount: 10, animationBlock:  { [weak self] in
//                self?.gifAnimationView.animate(withGIFNamed: "random.gif")
//            })
//        }
//    }
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        self.backgroundColor = .PM.detailBackground
        self.addSubview(titleLabel)
        self.addSubview(randomRestaurant)
        self.addSubview(randomButton)
        randomButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        randomButton.layer.shadowOpacity = 0.2
        randomButton.layer.shadowColor = UIColor.black.cgColor
//        playGifVideo()
    }
    
    func Constraint() {
        titleLabelConstraint()
        randomRestaurantConstraint()
        randomButtonConstraint()
//        gitLogoImageConstraint()
    }
    
    func titleLabelConstraint(){
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(80)
            
        }
    }
    
    func randomRestaurantConstraint(){
        randomRestaurant.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
        }
    }
    
    func randomButtonConstraint(){
        randomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(randomRestaurant.snp.bottom).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
    }
}

