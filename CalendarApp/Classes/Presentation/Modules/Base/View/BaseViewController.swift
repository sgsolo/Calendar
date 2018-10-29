//
//  BaseViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 27/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewInput {

    var _output: BaseViewOutput!
    var _moduleInput: BaseModuleInput!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        _output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _output.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _output.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _output.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _output.viewDidDisappear()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        _output.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _output.viewDidLayoutSubviews()
    }
}
