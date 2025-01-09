//
//  sampleCollectionViewCell.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/9/25.
//

import UIKit

class sampleCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        print(String(describing: self))
        return String(describing: self)
    }

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        print(#function, "radius \(photoImageView.frame.width/2)")
        super.awakeFromNib()
    }
    
    // 하위뷰가 다시 그려질때 실행해주는 함수...??
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function, "radius \(photoImageView.frame.width/2)")
        photoImageView.layer.cornerRadius = photoImageView.frame.width/2
    }

    // 이게 몰까?
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print(#function, "radius \(photoImageView.frame.width/2)")
    }

}
