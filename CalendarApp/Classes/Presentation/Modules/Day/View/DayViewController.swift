//
//  DayViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class DayViewController: UIViewController, DayViewInput {

    var output: DayViewOutput!
    var moduleInput: DayModuleInput!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapNavigationItem))
    }
    
    //MARK: Actions
    
    @objc func didTapNavigationItem() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
