//
//  EditExercisePresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import Foundation

class EditExercisePresenter: NSObject, EditExerciseModuleInput, EditExerciseViewOutput, EditExerciseInteractorOutput {

    weak var view: EditExerciseViewInput!
    var interactor: EditExerciseInteractorInput!
    var router: EditExerciseRouterInput!
}
