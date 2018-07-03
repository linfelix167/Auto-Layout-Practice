//
//  SwipingController+extension.swift
//  Auto Layout
//
//  Created by Felix Lin on 7/3/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

extension SwipingController {
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    coordinator.animate(alongsideTransition: { (_) in
      self.collectionViewLayout.invalidateLayout()
      
      if self.pageControl.currentPage == 0 {
        self.collectionView?.contentOffset = .zero
      } else {
        let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      }
    }, completion: nil)
  }
  
}
