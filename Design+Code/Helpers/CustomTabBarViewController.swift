//
//  CustomTabBarViewController.swift
//  Design+Code
//
//  Created by M on 2022/5/9.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tabBar.tintColor = UIColor(named: "TabBarTint")!
        
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        //限制 只有 左上 和 右上角 使用圆角
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        self.additionalSafeAreaInsets.bottom = 20
        
    }

}
