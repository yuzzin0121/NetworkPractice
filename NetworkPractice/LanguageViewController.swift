//
//  LanguageViewController.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import UIKit

class LanguageViewController: UIViewController {
    @IBOutlet weak var languageTableView: UITableView!
    @IBOutlet weak var AllLangLabel: UILabel!
    
    var langList = Language.LanguageList
    var selectedLang = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        designLabel(AllLangLabel, cornerRadius: 14)
        AllLangLabel.text = "모든 언어"
    }
    func designLabel(_ label: UILabel, cornerRadius: CGFloat = 0) {
        label.clipsToBounds = true
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        label.layer.cornerRadius = cornerRadius
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
    }

    func configureTableView() {
        languageTableView.delegate = self
        languageTableView.dataSource = self
        let langNib = UINib(nibName: LangTableViewCell.identifier, bundle: nil)
        languageTableView.register(langNib, forCellReuseIdentifier: LangTableViewCell.identifier)
    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LangTableViewCell.identifier, for: indexPath) as! LangTableViewCell
        
        let langArray = [String](langList.values)
        let langString = langArray[indexPath.row]
        
        if langString == selectedLang {
            cell.configureCell(lang: langString, selected: true)
        } else {
            cell.configureCell(lang: langString, selected: false)
        }
        
        return cell
    }
}
