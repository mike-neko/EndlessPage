//
//  PageViewController.swift
//  EndlessPage
//
//  Created by M.Ike on 2016/12/14.
//  Copyright © 2016年 M.Ike. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    var index = Int(0)
    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = "\(index)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
