//
//  sampleCollectionViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/9/25.
//

import UIKit

class SampleCollectionViewController: UIViewController {

    var totalList = Array(1...100) // 기준점이 되는 전체 데이터
    // var filteredList: [Int] = totalList // 검색 필터링이 반영될 데이터
    // totalList, filteredList -> 이 둘은 같은 타이밍에 초기화 된다.

    // 그렇기 때문에 초기화 시점을 미뤄주는 lazy 를 사용한다. (지연 저장 프로퍼티)
    lazy var filteredList: [Int] = totalList
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var listCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchBar()
        configureCollectionView()
        
        configureBannerCollectionViewLayout()
        configureListCollectionViewLayout()
        
        print(1)

        // 나 이거 나중에 할게~
        DispatchQueue.main.async {
            print(2)
        }
        
        print(3)
        print(4)

    }

}

// MARK: - CollectionView 설정
extension SampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self

        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        
        let id = sampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
        listCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func configureBannerCollectionViewLayout() {
        bannerCollectionView.isPagingEnabled = true
        bannerCollectionView.collectionViewLayout = SampleCollectionViewController.collectionViewLayout()
    }
    
    func configureListCollectionViewLayout() {
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        let itemInRow: CGFloat = 4
        
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (sectionInset*2) - (cellSpacing*2)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellWidth/itemInRow, height: cellWidth/itemInRow*1.2)
        
        layout.sectionInset = UIEdgeInsets(top: sectionInset/2, left: sectionInset, bottom: sectionInset/2, right: sectionInset)
        
        listCollectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sampleCollectionViewCell.identifier, for: indexPath) as! sampleCollectionViewCell
        
        cell.backgroundColor = .cyan
        cell.photoImageView.backgroundColor = .yellow
        cell.titleLabel.text = "\(filteredList[indexPath.item])"
        
        print(#function, "radius \(cell.photoImageView.frame.width/2)")

        // GCD
        DispatchQueue.main.async { // 코드 실행 시점을 나중으로 바꿔준다
            print("DispatchQueue.main.async - radius \(cell.photoImageView.frame.width/2)")
            cell.photoImageView.layer.cornerRadius =
            cell.photoImageView.frame.width/2
        }
        
        return cell
    }
    
}

// MARK: - SearchBar 설정
extension SampleCollectionViewController: UISearchBarDelegate {
    
    func configureSearchBar() {
        searchBar.delegate = self
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
//        searchBar.showsCancelButton = true
        searchBar.setShowsCancelButton(true, animated: true)

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        
        var result: [Int] = []
        
        if searchText == "" {
            // 아무것도 입력이 없으면 전체 갱신
            result = totalList
        } else {
            print(searchText)
            for item in totalList {
                print("for", item, searchText)

                if item == Int(searchText)! {
                    print("if", item, searchText)
                    result.append(item)
                }
            }
        }
        filteredList = result
        listCollectionView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
//        searchBar.showsCancelButton = false
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    // return키 눌렀을 때
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.setShowsCancelButton(false, animated: true)

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
    
}
