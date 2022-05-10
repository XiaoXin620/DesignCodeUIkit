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
        
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        subtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.maximumContentSizeCategory = .extraLarge
        descriptionLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
