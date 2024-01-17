//
//  BookCollectionViewCell.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookThumbnailImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        bookThumbnailImageView.contentMode = .scaleAspectFill
        bookTitleLabel.design(font: .boldSystemFont(ofSize: 15))
        bookPublisherLabel.design(textColor: .gray, font: .systemFont(ofSize: 13))
        bookPriceLabel.design(font: .boldSystemFont(ofSize: 15))
    }

    func configureCell(item: Any) {
        let document = item as! Document
        if let urlString = document.thumbnail {
            if let imageUrl = URL(string: urlString) {
                bookThumbnailImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "defaultBook"))
            }
        } else {
            bookThumbnailImageView.image = UIImage(named: "defaultBook")
        }
        
        bookTitleLabel.text = document.title
        bookPublisherLabel.text = document.publisher
        bookPriceLabel.text = "\(document.price)원"
        
    }
}
