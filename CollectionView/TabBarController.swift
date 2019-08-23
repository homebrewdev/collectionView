//
//  TabBarController.swift
//  alertController
//
//  Created by Egor Devyatov on 20/08/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View controllers of my Tab Controller:")
        print("\(String(describing: self.viewControllers))")
    }
}
