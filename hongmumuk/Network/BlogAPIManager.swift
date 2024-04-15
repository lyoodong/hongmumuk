//
//  BlogAPIManager.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/08/17.
//

import Foundation
import Alamofire

class BlogAPIManager {
    
    static let shared = BlogAPIManager()
    private init() { }
    
    func callRequest(query:String, category:String, complitionHandler: @escaping (BlogModelSingleton.BlogModel) ->Void) {
        
        let text = "홍대" + query
        guard let encodeQuery = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let url = "https://openapi.naver.com/v1/search/blog.json?query=\(encodeQuery)"
        let headers:HTTPHeaders = [
            "X-Naver-Client-Id":APIKey.clientId,
            "X-Naver-Client-Secret":APIKey.clientScret
        ]
    
        AF.request(url, headers: headers).validate().responseDecodable(of: BlogModelSingleton.BlogModel.self)  { reponse in
            switch reponse.result {
                
            case .success(let value):
                print("BlogAPIManager request 성공")
                complitionHandler(value)
                
            case .failure(let error):
                print("BlogAPIManager request 실패")
                print("===오류 메시지===", error)
            }
        }
    }
    
}


