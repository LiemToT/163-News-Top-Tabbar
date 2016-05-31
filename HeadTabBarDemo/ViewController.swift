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
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
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
            
            if i == 0 {
                btn.selected = true
                btn.transform = CGAffineTransformMakeScale(1.2, 1.2)
                lastTapButton = btn
            }
            
            headScrollView!.addSubview(btn)
        }

        view.addSubview(headScrollView!)
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
            btn.transform = CGAffineTransformMakeScale(1.2, 1.2)
            self.lastTapButton?.transform = CGAffineTransformIdentity
            
            let index = Int(CGFloat(self.view.bounds.size.width) / 2.0 / 80.0)
            
            if (btn.tag - 100) >= index && (btn.tag - 100) < self.tabTitleArray!.count - index {
                let needToMove = btn.center.x - self.headScrollView!.contentOffset.x - self.SCREEN_WIDTH / 2
                self.headScrollView?.setContentOffset(CGPointMake(self.headScrollView!.contentOffset.x + needToMove, 0) , animated: true)
            }
            
            let isInRange:Bool = btn.tag - 100 == index - 1 || btn.tag - 100 == self.tabTitleArray!.count - index
            
            if isInRange && self.headScrollView?.contentOffset.x != 0 {
                if btn.tag - 100 == index - 1 {
                    self.headScrollView?.setContentOffset(CGPointMake(0, 0), animated: true)
                } else {
                    self.headScrollView?.scrollRectToVisible((self.headScrollView?.viewWithTag(100 + self.tabTitleArray!.count - 1)?.frame)!, animated: true)
                }
            }
            
            }, completion: nil)
        
        self.lastTapButton = btn
        
        switch btn.tag {
        case 100:
            break
        case 101:
            break
        default:
            break
        }
    }
}

