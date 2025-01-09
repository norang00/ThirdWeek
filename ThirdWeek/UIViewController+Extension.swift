//
//  UIViewController+Extension.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/9/25.
//

import UIKit

extension UIViewController {
    
    // UIViewController 의 Extension 이기 때문에 모든 UIViewController 에서 이 메소드를 가지게 된다.
 
    static func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        // 디바이스에 따른 사이즈 조정
        // main 은 나중에 deprecated 될 예정
        // AppDelegate, SceneDelegate 에 관련된다
        // 멀티윈도우 때문임. 아이폰에서는 문제 없는데, 아이패드에서 필요해짐
        layout.itemSize = CGSize(
            width: 100,
            height: 100
        )
        // height: view.window?.windowScene?.screen.bounds.height!
        // layout.itemSize = CGSize(width: 100, height: 50)

        // 컬렉션 왼편에 스크롤 되는 자연스러운 여백을 주고 싶을때
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100)
        
        return layout
    }
}
// 이거 나중에 해봐야지
//extension UICollectionViewFlowLayout {
//    func setLayout() {
//        self.scrollDirection
//    }
//}
