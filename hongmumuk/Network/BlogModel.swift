//
//  File.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import UIKit

class BlogModelSingleton {
    
    static let shared = BlogModelSingleton()
    private init() { }
    
    // MARK: - BlogModel
    
    struct BlogModel: Codable {
        let lastBuildDate: String
        let total, start, display: Int
        let items: [Item]
    }

    // MARK: - Item
    struct Item: Codable {
        let title: String
        let link: String
        let description, bloggername: String
        let bloggerlink: String
        let postdate: String
    }
    
}
