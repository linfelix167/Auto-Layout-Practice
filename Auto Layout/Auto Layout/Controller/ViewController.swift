//
//  ViewController.swift
//  Auto Layout
//
//  Created by Felix Lin on 6/28/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let bearImageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "bear"))
    
    // enable autolayout for imagebiew
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    
    return imageView
  }()
  
  let descriptionTextView: UITextView = {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    
    let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
    
    attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
    
    textView.attributedText = attributedText
    textView.textAlignment = .center
    textView.isEditable = false
    textView.isScrollEnabled = false
    
    return textView
  }()
  
  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Next", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.mainPink, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.currentPage = 0
    pc.numberOfPages = 4
    pc.currentPageIndicatorTintColor = .mainPink
    pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    return pc
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(descriptionTextView)
    
    setupButtonControls()
    setuoLayout()
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
  
  func setuoLayout() {
    
    let topImageContainerView = UIView()
    view.addSubview(topImageContainerView)
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    // setup bear imageview
    topImageContainerView.addSubview(bearImageView)
    bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    
    
    // setup description textview
    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
}

extension UIColor {
  static var mainPink = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

