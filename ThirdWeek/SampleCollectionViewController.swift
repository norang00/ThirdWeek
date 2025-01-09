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

    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
        configureCollectionViewLayout()
    }

}

// MARK: - CollectionView 설정
extension SampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        let id = sampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func configureCollectionViewLayout() {
        bannerCollectionView.isPagingEnabled = true
        bannerCollectionView.collectionViewLayout = SampleCollectionViewController.collectionViewLayout()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sampleCollectionViewCell.identifier, for: indexPath) as! sampleCollectionViewCell
        
        cell.backgroundColor = .cyan
        cell.photoImageView.backgroundColor = .lightGray
        cell.titleLabel.text = "\(indexPath.item), \(indexPath.row)"
        
        return cell
    }
    
}
