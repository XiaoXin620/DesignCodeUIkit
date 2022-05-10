//
//  TopicsTableViewCell.swift
//  Design+Code
//
//  Created by M on 2022/5/10.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    
    @IBOutlet var topicLabel: UILabel!
    @IBOutlet var topicIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Accessibility
        topicLabel.adjustsFontForContentSizeCategory = true
        topicLabel.maximumContentSizeCategory = .extraExtraLarge
        topicLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
