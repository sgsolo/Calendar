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
        output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        output.viewDidDisappear()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        output.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        output.viewDidLayoutSubviews()
    }
}
