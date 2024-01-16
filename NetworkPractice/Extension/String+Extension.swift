//
//  String+Extension.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import Foundation

extension String {
    func stringToDate(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter.date(from: string) ?? Date()
    }
}
