//
//  CoursesTableViewCell.swift
//  Design+Code
//
//  Created by M on 2022/5/8.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var courseBackground: UIImageView!
    @IBOutlet var courseBanner: UIImageView!
    @IBOutlet var courseLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
