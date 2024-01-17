//
//  Papago.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import Foundation

struct Papago: Codable {
    let message: PapagoResult
}

struct PapagoResult: Codable {
    let result: PapagoFinal
}

struct PapagoFinal: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}

struct Language {
    static let LanguageList = [
        "ko":"한국어",
        "en":"영어",
        "ja":"일본어",
        "zh-CN":"중국어 간체",
        "zh-TW":"중국어 번체",
        "vi":"베트남어",
        "id":"인도네시아어",
        "th":"태국어",
        "de":"독일어",
        "es":"스페인어",
        "it":"이탈리아어",
        "fr":"프랑스어"
    ]
}
