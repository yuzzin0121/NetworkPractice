//
//  LangTableViewCell.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import UIKit

class LangTableViewCell: UITableViewCell{

    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        languageLabel.design(font: .boldSystemFont(ofSize: 16))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(lang: String, selected: Bool) {
        languageLabel.text = lang
        if selected {
            languageLabel.textColor = .green
        }
    }
}
