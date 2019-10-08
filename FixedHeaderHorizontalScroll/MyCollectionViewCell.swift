//
//  MyCollectionViewCell.swift
//  FixedHeaderHorizontalScroll
//
//  Created by 강전구 on 08/10/2019.
//  Copyright © 2019 강전구. All rights reserved.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    weak var scrollDelegate: CustomScrollDelegate?
    
    func initScrollListener() {
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.didScroll(to: scrollView.contentOffset.x)
    }
    
    func moveScrollPosition(to position: CGFloat) {
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = position
            }, completion: nil)
        }
    }
}
