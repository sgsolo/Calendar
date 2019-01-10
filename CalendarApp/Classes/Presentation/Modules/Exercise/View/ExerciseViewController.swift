//
//  ExerciseViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import UIKit

class ExerciseViewController: BaseViewController, ExerciseViewInput {

    var output: ExerciseViewOutput!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
    }
    
    // MARK: Actions
    
    @IBAction func didTapAddButton(_ sender: Any) {
        output.didTapAddButton()
    }
}
