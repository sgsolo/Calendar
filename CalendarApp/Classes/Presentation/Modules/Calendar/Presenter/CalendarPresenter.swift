//
//  CalendarPresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class CalendarPresenter: NSObject, CalendarModuleInput, CalendarViewOutput, CalendarInteractorOutput {

    weak var view: CalendarViewInput!
    var interactor: CalendarInteractorInput!
    var router: CalendarRouterInput!
}

extension CalendarPresenter  {
    
    func didCalendarTap(date: Date) {
        router.openEditDateModule()
    }
}
