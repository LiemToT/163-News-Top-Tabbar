//
//  ContentViewController.swift
//  HeadTabBarDemo
//
//  Created by linyi on 16/5/31.
//  Copyright © 2016年 linyi. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var titleContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func initFrame() {
        let contentLabel = UILabel(frame: CGRectMake(CGRectGetWidth(view.frame) / 2 - 30, CGRectGetHeight(view.frame) / 2, 60, 20))
        contentLabel.text = titleContent
        contentLabel.textAlignment = .Center
        view.addSubview(contentLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
