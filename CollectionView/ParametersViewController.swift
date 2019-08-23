//
//  ParametersViewController.swift
//  alertController
//
//  Created by Egor Devyatov on 19/08/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit
import Foundation

class ParametersViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    
    @IBOutlet weak var elementSizeSlider: UISlider!
    
    @IBOutlet weak var elementSizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementSizeLabel.text = "80"
    }
    
    @IBAction func saveButtonTap(_ sender: UIButton) {
        
        // анимация кнопочки
        sender.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.10),
                       initialSpringVelocity: CGFloat(3.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
        })
    
        if firstTextField.text != "" {
            sourceData.append(firstTextField.text!)
        } else {sourceData.append("element")}
        
        if secondTextField.text != "" {
            sourceData.append(secondTextField.text!)
        } else {sourceData.append("element")}
        
        if thirdTextField.text != "" {
            sourceData.append(thirdTextField.text!)
        } else {sourceData.append("element")}
        
        if fourTextField.text != "" {
            sourceData.append(fourTextField.text!)
        } else {sourceData.append("element")}
        
        if fifthTextField.text != "" {
            sourceData.append(fifthTextField.text!)
        } else {sourceData.append("element")}
        
        if elementSizeSlider.value != 80 {
            elementSize = Int(elementSizeSlider.value)
        }
    }
    
    @IBAction func sliderTap(_ sender: UISlider) {
        elementSizeLabel.text = String( Int(elementSizeSlider.value))
    }
    
}
