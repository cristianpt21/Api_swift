//
//  ViewController.swift
//  post
//
//  Created by Stone web on 21/09/20.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTab()
    }
    func configTab(){
        // Always adopt a light interface style.
        overrideUserInterfaceStyle = .light
        guard let PostListViewController = UIStoryboard(name: "PostListViewController", bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        PostListViewController.tabBarItem.title = "List Post"
        PostListViewController.tabBarItem.image = UIImage(named: "icon_series")
        setViewControllers([PostListViewController], animated: false)
    }
}

