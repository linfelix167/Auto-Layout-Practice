//
//  SwipingController.swift
//  Auto Layout
//
//  Created by Felix Lin on 6/29/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let pages = [
    Page(imageName: "bear", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
    Page(imageName: "heart", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
    Page(imageName: "leaf", headerText: "VIP members special services", bodyText: "")
  ]
  
  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
    return button
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Next", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.mainPink, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
    return button
  }()
  
  lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.currentPage = 0
    pc.numberOfPages = 4
    pc.currentPageIndicatorTintColor = .mainPink
    pc.numberOfPages = pages.count
    pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    return pc
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupButtonControls()
    
    collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    collectionView?.isPagingEnabled = true
  }
  
  @objc private func handleNext() {
    let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
  
  @objc private func handlePrev() {
    let nextIndex = max(pageControl.currentPage - 1, 0)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
  
  fileprivate func setupButtonControls() {
    
    let buttonControllsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
    buttonControllsStackView.translatesAutoresizingMaskIntoConstraints = false
    buttonControllsStackView.distribution = .fillEqually
    view.addSubview(buttonControllsStackView)
    
    NSLayoutConstraint.activate([
      buttonControllsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      buttonControllsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      buttonControllsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      buttonControllsStackView.heightAnchor.constraint(equalToConstant: 50)
      ])
  }
  
  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = targetContentOffset.pointee.x
    
    pageControl.currentPage = Int(x / view.frame.width)
  }
}
