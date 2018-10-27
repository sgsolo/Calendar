//
//  BasePresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 27/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class BasePresenter: NSObject, BaseModuleInput, BaseViewOutput, BaseInteractorOutput {

    weak var view: BaseViewInput!
    var interactor: BaseInteractorInput!
    var router: BaseRouterInput!
}
