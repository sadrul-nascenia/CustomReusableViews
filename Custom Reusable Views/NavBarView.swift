//
//  NavBarView.swift
//  Custom Reusable Views
//
//  Created by ITADMIN on 3/19/18.
//  Copyright © 2018 ITADMIN. All rights reserved.
//

import UIKit

//@IBDesignable
class NavBarView: UIView {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var rewardBtn: MIBadgeButton!
    @IBOutlet weak var notificationBtn: MIBadgeButton!
    @IBOutlet weak var menuBtn: MIBadgeButton!
    
    private var notiFicationCount = 0 {
        didSet{
            if notiFicationCount > 0 {
                notificationBtn.badgeString = String(notiFicationCount)
            } else {
                notificationBtn.badgeString = nil
            }
        }
    }
    
    private var contentView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
        //handleMenuOption()
        self.backgroundColor = .white
        notiFicationCount = 5
    }
    
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction private func backAction(_ sender: UIButton) {
        DLog("Back option tapped")
    }
    
    @IBAction private func rewardAction(_ sender: MIBadgeButton) {
        DLog("Reward option tapped")
    }
    
    @IBAction private func notifyAction(_ sender: MIBadgeButton) {
        DLog("Notify option tapped")
    }
    
    @IBAction private func menuAction(_ sender: MIBadgeButton) {
        DLog("Menu option tapped")
    }

}

