//
//  BookViewController.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import UIKit

class BookViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var bookCollectionView: UICollectionView!
    let bookAPIManager = BookAPIManager()
    var bookInfos: [Document] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureCollectionView()
        bookAPIManager.callRequest(text: "swift") { values in
            print(values)
            self.bookInfos = values
            self.bookCollectionView.reloadData()
        }
    }
    
    func configureCollectionView() {
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        let BookNib = UINib(nibName: BookCollectionViewCell.identifier, bundle: nil)
        bookCollectionView.register(BookNib, forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 12
        
        let cellWidth = UIScreen.main.bounds.width - (spacing*2) - 8
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: (cellWidth/2) * 1.7)
//        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        bookCollectionView.collectionViewLayout = layout
     
    }
    
    func configureView() {
        navigationItem.title = "도서 검색"
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "도서명을 검색해보세요"
        navigationItem.hidesSearchBarWhenScrolling = false // 스크롤할 때도 서치바 보이기
        searchController.searchBar.delegate = self
    }

}

// 검색바 설정
extension BookViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let text = searchBar.text!
//        bookAPIManager.callRequest(text: text) { values in
//            bookInfos = values
//            bookCollectionView.reloadData()
//        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text!
        bookAPIManager.callRequest(text: text) { values in
            self.bookInfos = values
            self.bookCollectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let text = "swift"
        bookAPIManager.callRequest(text: text) { values in
            self.bookInfos = values
            self.bookCollectionView.reloadData()
        }
    }
}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
        
        cell.configureCell(item: bookInfos[indexPath.row])
        
        return cell
    }
    
    
}
