//
//  SAVasChildVC.swift
//  Single App
//
//  Created by Sadrul on 11/23/17.
//  Copyright © 2017 Sadrulnascenia. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChildVC: UIViewController {
    
    
    var itemInfo = IndicatorInfo(title: "Title")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ChildVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
