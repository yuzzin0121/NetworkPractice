//
//  BeerAPIManager.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import Foundation

import Foundation
import Alamofire

struct BeerAPIManager {
    func callRequest(completionHandler: @escaping ([Beer]) -> Void) {
        
        let url = "https://api.punkapi.com/v2/beers"
        
        AF.request(url, method: .get).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                completionHandler(success)
//                self.dateLabel.text = success.drwNoDate
            case .failure(let failure):
                print("오류 발생")
            }
        }
    }
}
