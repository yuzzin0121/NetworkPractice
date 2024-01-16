//
//  LottoAPIManager.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import Foundation
import Alamofire

struct LottoAPIManager {
    
    
    func callRequest(number: String, completionHandler: @escaping (Lotto) -> Void) {
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
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
