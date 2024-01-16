//
//  Lotto.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import Foundation

struct Lotto: Codable {
    let drwNo: Int  // 회차
    let drwNoDate: String  // 날짜
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}
