//
//  CouresesViewController.swift
//  Design+Code
//
//  Created by M on 2022/5/8.
//

import UIKit

class CouresesViewController: UIViewController {
    
    var course: Course?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("this course is \(course?.courseTitle)")
    }

}
