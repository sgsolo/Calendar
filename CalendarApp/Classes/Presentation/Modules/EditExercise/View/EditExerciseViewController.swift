//
//  EditExerciseViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import UIKit

class EditExerciseViewController: BaseViewController, EditExerciseViewInput {

    var output: EditExerciseViewOutput!

    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var extraWeightTextField: UITextField!
    
    // MARK: Lifecycle
    
    override func setupView() {
        super.setupView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveBarButtonItem))
    }
    
    @objc func saveBarButtonItem(sender: UIBarButtonItem) {
        if let quantity = quantityTextField.text, let extraWeight = extraWeightTextField.text {
            output.save(quantity: quantity, extraWeight: extraWeight)
        }
    }
}
