//
//  CustomAlert.swift
//  alertController
//
//  Created by Egor Devyatov on 19/08/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

//Method 7:
//
//Alert with out shared class with Extension in separate class for alert.
//
//    Create one new Swift class, and import UIKit. Copy and paste below code.

import UIKit
import Foundation

extension UIAlertController {
     class func showAlert(title:String, msg:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}

//Now call alert function like this in all your classes (Single line).
//
//UIAlertController.alert(title:"Title", msg:"Message", target: self)
//How is it....
