//
//  BookAPIManager.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import Foundation
import Alamofire

struct BookAPIManager {
    func callRequest(text: String, completionHandler: @escaping ([Document]) -> Void) {
        // 한글 검색이 안된다면 인코딩 처리
//        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let size = 30
        let page = 1
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)&size=\(size)&page=\(page)"
        
        // 인증key는 소중하게 보관해야 된다.
        let headers: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        
        AF.request(url,
                   method: .get,
                   headers: headers)
        .responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let success):
                print(success.documents)
                completionHandler(success.documents)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
