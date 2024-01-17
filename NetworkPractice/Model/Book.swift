//
//  Book.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import Foundation

// MARK: - Book
struct Book: Codable {
    let documents: [Document]
    let meta: Meta
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents, datetime, isbn: String    // 도서 소개, 도서 출판날짜(yyyy-MM-ddThh:mm:ss.000+), 국제 표준 도서번호
    let price: Int  // 도서 정가
    let publisher: String   // 도서 출판사
    let salePrice: Int  // 도서 판매가
    let status: String  // 도서 판매 상태 정보 (정상, 품절, 절판 등)
    let thumbnail: String  // 도서 표지 미리보기 URL
    let title: String    // 도서 제목
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, url
    }
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
