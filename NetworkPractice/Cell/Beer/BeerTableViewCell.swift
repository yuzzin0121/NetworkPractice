//
//  BeerTableViewCell.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell, TableViewCellProtocol {
    
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerDescription: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var beerBrewsTips: UILabel!
    @IBOutlet weak var beerBrewsTipsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        beerNameLabel.design(font: .boldSystemFont(ofSize: 20))
        beerImageView.contentMode = .scaleAspectFit
        beerDescription.design(text: "Beer Description", font: .boldSystemFont(ofSize: 16))
        beerDescriptionLabel.design(textColor: .gray, font: .systemFont(ofSize: 14), numberOfLines: 0)
        beerBrewsTips.design(text: "Beer Brews Tips", font: .boldSystemFont(ofSize: 16))
        beerBrewsTipsLabel.design(textColor: .gray, font: .systemFont(ofSize: 14), numberOfLines: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item: Any) {
        let beerInfo = item as! Beer
        beerNameLabel.text = beerInfo.name
        let url = URL(string: beerInfo.image_url)
        
        beerImageView.kf.setImage(with: url!)
        beerDescriptionLabel.text = beerInfo.description
        beerBrewsTipsLabel.text = beerInfo.brewers_tips
    }
}
