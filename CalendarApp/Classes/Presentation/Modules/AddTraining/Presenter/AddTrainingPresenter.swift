//
//  AddTrainingPresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class AddTrainingPresenter: NSObject, AddTrainingModuleInput, AddTrainingViewOutput, AddTrainingInteractorOutput {

    weak var view: AddTrainingViewInput!
    var interactor: AddTrainingInteractorInput!
    var router: AddTrainingRouterInput!
}
