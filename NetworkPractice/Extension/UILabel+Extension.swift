//
//  UILabel+Extension.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import Foundation
import UIKit

extension UILabel {
    func design(text: String = "", textColor: UIColor = .black, font: UIFont = .systemFont(ofSize: 14),  textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
