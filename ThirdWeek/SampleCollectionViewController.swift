//
//  sampleCollectionViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/9/25.
//

import UIKit

class SampleCollectionViewController: UIViewController {

    var list = Array(1...100)
    
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var listCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureCollectionViewLayout()
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
    
    func configureCollectionViewLayout() {
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
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sampleCollectionViewCell.identifier, for: indexPath) as! sampleCollectionViewCell
        
        cell.backgroundColor = .cyan
        cell.photoImageView.backgroundColor = .yellow
        cell.titleLabel.text = "\(indexPath.item)"
        
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
