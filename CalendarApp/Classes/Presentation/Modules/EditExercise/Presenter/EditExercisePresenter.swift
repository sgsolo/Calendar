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
    
    var exercise: Exercise!
    weak var delegate: EditExerciseModuleDelegate!
    
    func save(quantity: String, extraWeight: String) {
        if let quantity = Int(quantity), let extraWeight = Int(extraWeight) {
            let approach = Approach(addedDate: Date(), quantity: quantity, extraWeight: extraWeight)
            exercise.approach?.append(approach)
            interactor.save(exercise: exercise)
            delegate.reloadData()
            router.popViewController()
        }
    }
}
