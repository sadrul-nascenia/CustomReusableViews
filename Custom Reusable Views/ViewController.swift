//
//  ViewController.swift
//  Custom Reusable Views
//
//  Created by ITADMIN on 3/19/18.
//  Copyright © 2018 ITADMIN. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class ViewController: BaseButtonBarPagerTabStripViewController<MenuCell> {

    @IBOutlet weak var menuView: ButtonBarView!
    @IBOutlet weak var contentView: UIScrollView!
    let selectedColor = UIColor.darkGray
    let unselectedIconColor = UIColor.lightGray
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "MenuCell", bundle: Bundle(for: MenuCell.self), width: { _ in
            return 80.0
        })
    }
    
    
    override func viewDidLoad() {
        setupPageMenu()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.isHidden = true
    }

    // MARK:- PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let sb = UIStoryboard(name: "Main", bundle: nil)
    
        let firstVC = sb.instantiateViewController(withIdentifier: "ChildVC") as! ChildVC
        firstVC.view.backgroundColor = UIColor.blue
        firstVC.itemInfo = IndicatorInfo(title: "First VC")
        
        let secondVC = sb.instantiateViewController(withIdentifier: "ChildVC") as! ChildVC
        secondVC.view.backgroundColor = UIColor.green
        secondVC.itemInfo = IndicatorInfo(title: "Second VC")


        let thirdVC = sb.instantiateViewController(withIdentifier: "ChildVC") as! ChildVC
        thirdVC.view.backgroundColor = UIColor.red
        thirdVC.itemInfo = IndicatorInfo(title: "Third VC")
        return [firstVC, secondVC, thirdVC]
    }
    
    override func configure(cell: MenuCell, for indicatorInfo: IndicatorInfo) {
        cell.iconImage.image = indicatorInfo.image?.withRenderingMode(.alwaysOriginal)
        cell.titleLbl.text = indicatorInfo.title
    }
    
    //MARK:- Setup Page Menu
    private func setupPageMenu() {
        buttonBarView = menuView
        containerView = contentView
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .clear
        // Indicator color
        settings.style.selectedBarBackgroundColor = self.selectedColor
        settings.style.selectedBarHeight = 4.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = self.unselectedIconColor
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarItemLeftRightMargin = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: MenuCell?, newCell: MenuCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            // oldCell?.iconImage.tintColor = self?.unselectedIconColor
            oldCell?.titleLbl.textColor = self?.unselectedIconColor
            // newCell?.iconImage.tintColor = self?.selectedColor
            newCell?.titleLbl.textColor = self?.selectedColor
        }
    }
}

