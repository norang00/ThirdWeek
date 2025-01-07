//
//  TestCollectionViewCell.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "TestCollectionViewCell"
    
    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        posterImageView.backgroundColor = .systemMint
        posterImageView.layer.cornerRadius = 8
        posterImageView.contentMode = .scaleAspectFit
        
    }

}
