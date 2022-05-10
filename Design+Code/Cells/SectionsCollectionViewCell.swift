//
//  SectionsCollectionViewCell.swift
//  Design+Code
//
//  Created by M on 2022/5/10.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var banner: UIImageView!
    @IBOutlet var logo: CustomImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
    }
    
    
    // 重复使用，以便利用资源
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}
