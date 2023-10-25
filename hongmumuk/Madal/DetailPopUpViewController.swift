//
//  DetailPopUpViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/18.
//

import SnapKit
import UIKit
import NMapsMap

class DetailPopUpViewController: UIViewController {
    
    //MARK: - UI ProPerties
    
    lazy var detailpopupview = DetailPopUpView()
    
    lazy var underLine:UIView = {
        let view = UIView()
        view.backgroundColor = .PM.underLineColor
        
        return view
    }()
    
    let naverMapView = NMFNaverMapView(frame:.zero)
    
    lazy var underLine2:UIView = {
        let view = UIView()
        view.backgroundColor = .PM.underLineColor
        
        return view
    }()
    
    lazy var bestRiviewLabel:UILabel = {
        let label = UILabel()
        label.text = "Best Review"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .white
        view.register(DetailPopUpCollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
        view.backgroundColor = .PM.detailBackground
        
        return view
    }()
    
    lazy var noneBlogReview:UILabel = {
        let view = UILabel()
        view.text = "블로그 후기가 없습니다."
        view.font = UIFont.hongFont.indiBold
        view.textColor = .gray
        view.isHidden = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callRequest()
        setView()
        constraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func callRequest() {
        print(#function, "실행")
        guard let query = detailpopupview.restaurantLabel.text, let category = detailpopupview.categoryLabel.text
        else { return }
        
        print(query)
        print(category)
        mapviewSet(lat: location.0, lng: location.1)
        BlogAPIManager.shared.callRequest(query: query, category: category) { result in
            self.items = result.items
            if self.items.count == 0 {
                self.noneBlogReview.isHidden = false
            } else {
                self.noneBlogReview.isHidden = true
                self.collectionView.reloadData()
            }
        }
        self.collectionView.reloadData()
    }
    
    
    
    //MARK: - Properties
    var searchItem = ""
    var items:[BlogModelSingleton.Item] = []
    var location:(Double, Double) = (0, 0)
    
    //MARK: - Set Ui
    
    func setView() {
        view.backgroundColor = .PM.detailBackground
        view.addSubview(detailpopupview)
        view.addSubview(bestRiviewLabel)
        view.addSubview(collectionView)
        view.addSubview(underLine)
        view.addSubview(naverMapView)
        view.addSubview(underLine2)
        view.addSubview(noneBlogReview)
    }
    
    func mapviewSet (lat:Double, lng:Double ) {
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: lat, lng: lng)
        marker.mapView = naverMapView.mapView
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: marker.position)
        naverMapView.mapView.moveCamera(cameraUpdate)
    }
    
    func constraint() {
        detailpopupview.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(130)
        }
        
        underLine.snp.makeConstraints { make in
            make.width.centerX.equalToSuperview()
            make.top.equalTo(detailpopupview.snp.bottom)
            make.height.equalTo(8)
        }
        
        naverMapView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.top.equalTo(underLine.snp.bottom).offset(20)
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.25)
        }
        
        underLine2.snp.makeConstraints { make in
            make.width.centerX.equalToSuperview()
            make.top.equalTo(naverMapView.snp.bottom).offset(20)
            make.height.equalTo(8)
        }
        
        bestRiviewLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(underLine2.snp.bottom).offset(20)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.width.equalToSuperview()
            make.top.equalTo(bestRiviewLabel.snp.bottom).offset(20)
        }
        
        noneBlogReview.snp.makeConstraints { make in
            let heigth = UIScreen.main.bounds.height
            
            make.centerX.equalToSuperview()
            make.top.equalTo(heigth * 0.6)
        }
        
        
    }
    
    func openURL(_ url: URL) {
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func stripHTMLTags(from htmlString: String) -> String {
        let htmlTagPattern = "<[^>]+>"
        let regex = try! NSRegularExpression(pattern: htmlTagPattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: htmlString.utf16.count)
        var strippedString = regex.stringByReplacingMatches(in: htmlString, options: [], range: range, withTemplate: "")
        
        strippedString = strippedString.replacingOccurrences(of: "&amp;", with: "&")
        strippedString = strippedString.replacingOccurrences(of: "&lt;", with: "<")
        strippedString = strippedString.replacingOccurrences(of: "&gt;", with: ">")
        strippedString = strippedString.replacingOccurrences(of: "&nbsp;", with: " ")
        strippedString = strippedString.replacingOccurrences(of: "&quot;", with: "\"")
        
        return strippedString
    }
    
}

extension DetailPopUpViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if items.count == 0 {
            noneBlogReview.isHidden = false
        }
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        let link = selectedItem.link
        guard let url = URL(string: link) else { return }
        openURL(url)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! DetailPopUpCollectionViewCell
        let item = items[indexPath.item]
        cell.titleLabel.text = stripHTMLTags(from: item.title)
        cell.blogRivew.text = stripHTMLTags(from: item.description)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 36
        let height = width * 0.3
        return CGSize(width: width, height: height)
    }
    
}
