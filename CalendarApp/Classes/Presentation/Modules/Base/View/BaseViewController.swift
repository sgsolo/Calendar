//
//  BaseViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 27/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewInput {

    var output: BaseViewOutput!
    var moduleInput: BaseModuleInput!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
