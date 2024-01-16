//
//  Protocol.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import Foundation
import UIKit

protocol ReuseProtocol {
    static var identifier: String { get }
}

protocol TableViewCellProtocol {
    func configureCell(item: Any) 
}

extension UITableViewCell: ReuseProtocol {
    static var identifier: String {
        get {
            String(describing: self)
        }
    }
}
