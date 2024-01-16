//
//  BeerViewController.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import UIKit

class BeerViewController: UIViewController {
    @IBOutlet weak var beerTableView: UITableView!
    let beerManager = BeerAPIManager()
    var beers: [Beer] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        beerManager.callRequest { value in
            self.beers = value
            self.beerTableView.reloadData()
        }
    }
    
    func configureTableView() {
        beerTableView.delegate = self
        beerTableView.dataSource = self
        let beerNib = UINib(nibName: BeerTableViewCell.identifier, bundle: nil)
        beerTableView.register(beerNib, forCellReuseIdentifier: BeerTableViewCell.identifier)
    }
    
    
}

extension BeerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as! BeerTableViewCell
        
        cell.configureCell(item: beers[indexPath.row])
        
        return cell
    }
}
