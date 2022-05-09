//
//  ViewController.swift
//  Design+Code
//
//  Created by M on 2022/4/30.
//

import UIKit
import Combine

class FeaturedViewController: UIViewController {

    @IBOutlet var cardView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var handbookCollectionView: UICollectionView!
    @IBOutlet var coursesTableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    
    private var tokens: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbookCollectionView.delegate = self
        handbookCollectionView.dataSource = self
        
        // 让阴影扩散
        handbookCollectionView.layer.masksToBounds = false
        
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        
        // 让阴影扩散
        coursesTableView.layer.masksToBounds = false
        
        coursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        scrollView.delegate = self
        
        
    }
}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        
        let handbook = handbooks[indexPath.item]
        
        cell.titleLabel.text = handbook.courseTitle
        cell.subtitleLabel.text = handbook.courseSubtitle
        cell.descriptionLabel.text = handbook.courseDescription
        cell.gradient.colors = handbook.courseGradient
        cell.logo.image = handbook.courseIcon
        cell.banner.image = handbook.courseBanner
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? CoursesViewController, let course = sender as? Course {
            detailVC.course = course
        }
    }
    
    
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in collectionView: UITableView) -> Int {
        return courses.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        
        
        let course = courses[indexPath.section]
        
        cell.titleLabel.text = course.courseTitle
        cell.subtitleLabel.text = course.courseSubtitle
        cell.descriptionLabel.text = course.courseDescription
        cell.courseBackground.image = course.courseBackground
        cell.courseBanner.image = course.courseBanner
        cell.courseLogo.image = course.courseIcon
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCourse = courses[indexPath.section]
        performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
    }
    
    
}

extension FeaturedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //内容高度
        let contentHeight = scrollView.contentSize.height
        
        // Y轴滚动距离
        let  lastScrollYPos = scrollView.contentOffset.y
        
        
        //计算内容百分比
        let percentage = lastScrollYPos / contentHeight
        
        if percentage < 0.15 {
            self.title = "Featured"
        } else if percentage <= 0.33 {
            self.title = "Handbooks"
        } else {
            self.title = "Courses"
        }
        
        
    }
}
