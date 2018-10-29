//
//  BaseViewOutput.swift
//  CalendarApp
//
//  Created by Calendar App on 27/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

protocol LifeCycleModuleOutput: class {
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
    
}

protocol BaseViewOutput: class, LifeCycleModuleOutput {

}
