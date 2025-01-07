//
//  CollectionViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

/*
 1. 이름
 2. 부하직원
 3. 필수기능
 4. 연결
 */

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: TestCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
        
        // **테이블뷰와 다르게, 컬렉션은 아이템 사이즈, 여백 등 레이아웃을 지정해주어야 한다.
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        // layout 자체는 오토레이아웃과 같이 기능하기 때문에, 디바이스 너비를 채우고자 하기 때문에 반영이 안될 수 있다.
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        // 그렇기 때문에 엣지 간격도 주어야 한다.
        layout.sectionInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        // 수치상 하나의 행에 넣을 수 있는 아이템 만큼만 한 행에 표시된다.
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.identifier, for: indexPath) as! TestCollectionViewCell
        
        
        return cell
    }
    
}
