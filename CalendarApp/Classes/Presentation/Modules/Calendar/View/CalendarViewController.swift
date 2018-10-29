//
//  CalendarViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, CalendarViewInput {

    var output: CalendarViewOutput!
    var moduleInput: CalendarModuleInput!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.testMethod()
    }
}
