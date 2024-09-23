//
//  ViewController.swift
//  Atlys_task
//
//  Created by Abhishek Jakhmola on 21/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var carouselView: UIView!
    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet var imageWidths: [NSLayoutConstraint]!
    @IBOutlet weak var pageController: UIPageControl!
    
    private var imageNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        loadImageNames()
        loadImages()
    }

    private func loadImageNames() {
        imageNames = ["Pic", "Pic_1", "Pic_2"]
    }

    private func loadImages() {
        for (index, imageName) in imageNames.enumerated() {
            imageViews[index].image = UIImage(named: imageName)
        }
        scrollToMiddle()
    }
    
    private func setImageDefaultWidths() {
        for (index, _) in imageNames.enumerated() {
            imageWidths[index].constant = 250
            imageViews[index].layer.cornerRadius = 0
        }
    }
    
    private func scrollToMiddle() {
        self.scrollView.contentSize = CGSize(width: carouselView.frame.width, height: carouselView.frame.height)
        let centerOffsetX = (carouselView.frame.width / 2) - 200
        let centerPoint = CGPoint(x: centerOffsetX, y: 0)
        scrollView.setContentOffset(centerPoint, animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / 200)
        setImageDefaultWidths()
        
        self.imageWidths[Int(pageIndex)].constant = 300
        self.imageViews[Int(pageIndex)].layer.cornerRadius = 20
        pageController.currentPage = Int(pageIndex)
    }
}

