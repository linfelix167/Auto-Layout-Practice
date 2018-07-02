//
//  PageCell.swift
//  Auto Layout
//
//  Created by Felix Lin on 6/29/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
  
  var page: Page? {
    didSet {
      guard let unwrappedPage = page else { return }
      bearImageView.image = UIImage(named: unwrappedPage.imageName)
      
      let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
      
      attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
      
      descriptionTextView.attributedText = attributedText
      descriptionTextView.textAlignment = .center
    }
  }
  
  private let bearImageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "bear"))
    
    // enable autolayout for imagebiew
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    
    return imageView
  }()
  
  private let descriptionTextView: UITextView = {
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    
    setuoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setuoLayout() {
    
    let topImageContainerView = UIView()
    addSubview(topImageContainerView)
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    // setup bear imageview
    topImageContainerView.addSubview(bearImageView)
    bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    
    
    // setup description textview
    addSubview(descriptionTextView)
    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
  }
}
