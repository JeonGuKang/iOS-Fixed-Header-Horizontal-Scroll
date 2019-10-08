//
//  ViewController.swift
//  FixedHeaderHorizontalScroll
//
//  Created by 강전구 on 08/10/2019.
//  Copyright © 2019 강전구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,CustomScrollDelegate  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "myCell"
    var items = Array(1...100)
    var position : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func didScroll(to position: CGFloat) {
        for cell in collectionView.visibleCells as! [MyCollectionViewCell] {
            (cell.scrollView as UIScrollView).contentOffset.x = position
            self.position = position
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.initScrollListener()
        cell.scrollDelegate = self
        cell.moveScrollPosition(to: self.position)
        return cell
    }
}

