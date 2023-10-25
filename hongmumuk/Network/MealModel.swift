//
//  MealModel.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/08/17.
//

import Foundation

//식당 카테고리
enum Category:String, CaseIterable {
    case koreanFood = "한식"
    case chineseFood = "중식"
    case japaneseFood = "일식"
    case westernFood = "양식"
    case centerLogo = ""
    case asianFood = "아시안"
    case fastFood = "패·푸"
    case schoolFood = "분식"
    case etcFood = "기타"
}

//음식 종류 별 식당틀
struct CategoryRestaurants {
    let name: Category
    let restaurants: [Restaurant]
}

//개별 음식점
class Restaurant {
    let name: String
    var location = (0.0, 0.0)
    private var isLiked: Bool = false
    
    init(name: String, location:(Double, Double)) {
        self.name = name
        self.location = location
    }
    
    func togleLike() {
        self.isLiked.toggle()
    }
}
