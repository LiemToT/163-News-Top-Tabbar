//
//  ViewController.swift
//  HeadTabBarDemo
//
//  Created by linyi on 16/5/31.
//  Copyright © 2016年 linyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tabTitleArray: NSArray?
    var headScrollView: UIScrollView?
    var lastTapButton: UIButton?
    
    var currentVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        tabTitleArray = ["头条", "娱乐", "体育", "财经", "科技", "NBA", "手机"]
        
        headScrollView = UIScrollView(frame: CGRectMake(0, 64, CGRectGetWidth(view.bounds), 40))
        headScrollView!.contentSize = CGSizeMake(CGFloat(tabTitleArray!.count * 80), 40)
        headScrollView!.backgroundColor = UIColor.greenColor()
        headScrollView?.showsHorizontalScrollIndicator = false
        
        for i in 0 ..< tabTitleArray!.count {
            let btn = UIButton(type: .Custom)
            btn.frame = CGRectMake(CGFloat(i * 80), 0, 80, 40)
            btn.setTitle(tabTitleArray![i] as? String, forState: .Normal)
            btn.tag = i + 100
            btn.setTitleColor(UIColor.redColor(), forState: .Selected)
            btn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
            btn.addTarget(self, action: Selector("didClickHeadButtonAction:"), forControlEvents: .TouchUpInside)
            headScrollView!.addSubview(btn)
        }

        view.addSubview(headScrollView!)
        
        let contentVC1 = ContentViewController()
        contentVC1.view.frame = CGRectMake(0, 104, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds) - 104)
        contentVC1.titleContent = tabTitleArray![0] as? String
        contentVC1.initFrame()
        addChildViewController(contentVC1)
        
        self.view.addSubview(contentVC1.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func didClickHeadButtonAction(btn: UIButton) {
        if btn == lastTapButton {
            return
        }
        
        btn.selected = true
        lastTapButton?.selected = false
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .CurveEaseIn, animations: { () -> Void in
            btn.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.lastTapButton?.transform = CGAffineTransformIdentity
            }, completion: { (finish) -> Void in
                self.lastTapButton = btn
        })
        
        switch btn.tag {
        case 100:
            
            break
        case 101:
            break
        default:
            break
        }
    }
    
    func replaceOldControllerToNew(oldController: UIViewController, newController: UIViewController) {
        
    }
}

