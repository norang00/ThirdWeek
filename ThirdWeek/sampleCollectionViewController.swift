//
//  sampleCollectionViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/9/25.
//

import UIKit

class sampleCollectionViewController: UIViewController {

    @IBOutlet var bannerCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

// MARK: - CollectionView 설정
extension sampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
}
