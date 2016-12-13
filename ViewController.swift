//
//  ViewController.swift
//  EndlessPage
//
//  Created by M.Ike on 2016/12/13.
//  Copyright © 2016年 M.Ike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private weak var pager: PagerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let vc as PagerViewController:
            pager = vc
        default: break
        }
    }
    
    @IBAction func changePage(_ sender: UISegmentedControl) {
        pager.changeActivePage(index: sender.selectedSegmentIndex)
        sender.selectedSegmentIndex = -1
    }

}

