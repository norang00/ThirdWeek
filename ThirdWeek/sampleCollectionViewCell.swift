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
        super.awakeFromNib()


    }

}
