//
//  DayInteractorInput.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

protocol DayInteractorInput: class {

    func add(exercise: String, date: Date)
    func getExecises(date: Date) -> [Exercise]
}
