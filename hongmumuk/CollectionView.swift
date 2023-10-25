//
//  CollectionV.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/15.
//

import UIKit

class CollectionView:UICollectionView {
    //MARK: - UI ProPerties
    
    //MARK: - Properties
    
    //MARK: - Define Method
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        SetView()
        Constraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    //MARK: - Set Ui
    func SetView() {

    }
    
    func Constraint() {
        
    }


}
