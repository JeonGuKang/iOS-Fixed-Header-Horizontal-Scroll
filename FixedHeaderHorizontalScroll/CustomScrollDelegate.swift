//
//  CustomScrollDelegate.swift
//  FixedHeaderHorizontalScroll
//
//  Created by 강전구 on 08/10/2019.
//  Copyright © 2019 강전구. All rights reserved.
//

import Foundation
import UIKit

protocol CustomScrollDelegate: class {
    func didScroll(to position: CGFloat)
}
