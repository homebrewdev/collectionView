//
//  ViewController.swift
//  alertController
//
//  Created by Egor Devyatov on 19/08/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertTapped(_ sender: Any) {
        UIAlertController.showAlert(title: "Alert", msg: "Alert message!", target: self)
    }
    
}

