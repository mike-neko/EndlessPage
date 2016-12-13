//
//  PagerViewController.swift
//  EndlessPage
//
//  Created by M.Ike on 2016/12/14.
//  Copyright © 2016年 M.Ike. All rights reserved.
//

import UIKit

class PagerViewController: UIPageViewController, UIPageViewControllerDataSource {
    var activePageIndex: Int {
        guard let vc = viewControllers?.first as? PageViewController else {
            return 0
        }
        return pages.index(of: vc) ?? 0
    }
    
    private var pages = [PageViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        pages = Array(1...5).flatMap {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "Page") as? PageViewController else {
                return nil
            }
            vc.index = $0
            return vc
        }
        
        setViewControllers([pages[0]], direction: .forward, animated: false)
        dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func changeActivePage(index: Int, animated: Bool = true) {
        guard pages.indices.contains(index) else { return }
        
        setViewControllers([pages[index]],
                           direction: (index > activePageIndex) ? .forward : .reverse,
                           animated: animated)
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PageViewController,
            var index = pages.index(of: vc)  else { return nil }
        
        index -= 1
        index = (index < pages.startIndex) ? pages.endIndex - 1 : index
        return pages[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PageViewController,
            var index = pages.index(of: vc)  else { return nil }
        
        index += 1
        index = (index >= pages.endIndex) ? pages.startIndex : index
        return pages[index]
    }

}
