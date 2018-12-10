//
//  DayPresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class DayPresenter: NSObject, DayModuleInput, DayViewOutput, DayInteractorOutput {

    weak var view: DayViewInput!
    var interactor: DayInteractorInput!
    var router: DayRouterInput!
}
