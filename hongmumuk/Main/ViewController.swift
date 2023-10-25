//
//  ViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/15.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    //MARK: - UI Properties
    lazy var mainCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    lazy var popButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(popButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var randomButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "random"), for: .normal)
        button.addTarget(self, action: #selector(randomButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var instaButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.addTarget(self, action: #selector(instaButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
//    lazy var admobView: GADBannerView = { // admob 부분
//        var view = GADBannerView()
//        let id = APIKey.googleid
//        view.adUnitID = id
//        view.load(GADRequest())
//
//        return view
//    }()
    
    //MARK: - Properties
    var selectedCategory:Bool = false
    var visibleData:[String] = []
    var cateogory = ""
    var selectedIndexPath:IndexPath?
    var passLocationData:[(Double,Double)] = []
    
    //MARK: - Define Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        Constraint()
    }
    
    @objc func randomButtonTapped(_ sender: UIButton) {
        let randomView = randomViewController()
        transition(viewController: randomView, style: .present)
    }
    
    @objc func instaButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://www.instagram.com/hongik_mumukji/?igshid=OGQ5ZDc2ODk2ZA%3D%3D")
        else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    @objc func popButtonTapped(_ sender: UIButton) {
        selectedCategory.toggle()
        configurePopButton()
        configureOtherButton()
        visibleDateSet()
    }
    
    func visibleDateSet() {
        
        if selectedCategory == false {
            
            visibleData = Category.allCases.map { $0.rawValue }
            mainCollectionView.reloadData()
        }
    }
    
    //MARK: - Set UI
    func setView() {
        addsubview()
        visibleDateSet()
        configurePopButton()
        configureOtherButton()
        configureButton()
    }
    
    func addsubview() {
        view.addSubview(mainCollectionView)
        view.addSubview(popButton)
        view.addSubview(randomButton)
        view.addSubview(instaButton)
    }
    
//    func admobViewSetView(){
//        admobView.rootViewController = self
//        admobView.delegate = self
//        self.view.addSubview(admobView)
//    }
    
    func configurePopButton() {
        popButton.isHidden = selectedCategory == false ? true : false
    }
    
    func configureOtherButton() {
        if selectedCategory == false || popButton.isSelected {
            instaButton.isHidden = false
            randomButton.isHidden = false
        } else {
            instaButton.isHidden = true
            randomButton.isHidden = true
        }
    }
    
    func configureButton() {
        [popButton, randomButton, instaButton].forEach { Button in
            Button.layer.cornerRadius = 45 / 2
            Button.layer.shadowColor = UIColor.black.cgColor
            Button.layer.shadowOpacity =  0.5
            Button.layer.shadowOffset = CGSize(width: 3, height: 3)
        }
    }
    
    @objc func logoButtonTapped(_ sender: UIButton) {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
    
    
    func Constraint() {
        mainCollectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(self.view.bounds.width)
            make.height.equalTo(self.view.bounds.width)
        }
        
        popButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(mainCollectionView.snp.bottom).offset(29)
            make.centerX.equalToSuperview()
        }
        
        randomButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(mainCollectionView.snp.bottom).offset(29)
            make.leading.equalTo(133)
        }
        
        instaButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(mainCollectionView.snp.bottom).offset(29)
            make.leading.equalTo(randomButton.snp.trailing).offset(40)
        }
        
//        admobView.snp.makeConstraints { make in
//            make.width.centerX.equalToSuperview()
//            make.height.equalTo(50)
//            make.bottom.equalToSuperview()
//        }
        
    }
    
}

//MARK: - Extension
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func likeButtonTapped(for cell: MainCollectionViewCell) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return visibleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailPopUpViewController()
        selectedIndexPath = indexPath
        switch selectedCategory {
        case true:
            vc.searchItem = visibleData[indexPath.row]
            vc.detailpopupview.restaurantLabel.text = visibleData[indexPath.row]
            vc.detailpopupview.categoryLabel.text = cateogory
            vc.location = passLocationData[indexPath.row]
            vc.detailpopupview.location = passLocationData[indexPath.row]
            
            transition(viewController: vc, style: .present)
            
        case false:
            if indexPath.row == 4 {
                let vc = InfoViewController()
                present(vc, animated: true)
                
            } else {
                self.selectedCategory.toggle()
                self.configurePopButton()
                self.configureOtherButton()
                self.cateogory = Data.shared.categories[indexPath.row].name.rawValue
                let data = Data.shared.categories[indexPath.row].restaurants
                self.visibleData = data.map { $0.name }
                self.passLocationData = data.map{ $0.location}
                self.mainCollectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! MainCollectionViewCell
        
        cell.titleLabel.text = visibleData[indexPath.row]
        cell.logo.isHidden = true
        
        switch selectedCategory {
        case true:
            cell.setBackgroundColor(cateogory)
            cell.titleLabel.font = UIFont.hongFont.indiBold
            
        case false:
            cell.titleLabel.font = UIFont.hongFont.Bold
            if indexPath.row == 4 {
                cell.logo.isHidden = false
                cell.backgroundColor = UIColor.white
                let image = UIImage(named: "Logo")
                cell.logo.setImage(image, for: .normal)
                cell.logo.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)
            
            } else {
                let name = visibleData[indexPath.row]
                cell.setBackgroundColor(name)
            }
            
        }
        
        cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveLinear, animations: {
            cell.transform = .identity }, completion: nil)

            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (collectionView.bounds.width - 8) / 3 - 4
        let size = CGSize(width: length, height: length)
        return size
        
    }
    
    
}

//extension ViewController : GADBannerViewDelegate {
//    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
//        bannerView.alpha = 0
//        UIView.animate(withDuration: 10) {
//            bannerView.alpha = 1
//        }
//    }
//}



extension UIImage {
    public func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}


