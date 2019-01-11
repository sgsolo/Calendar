//
//  ExercisePresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import Foundation

class ExercisePresenter: NSObject, ExerciseModuleInput, ExerciseViewOutput, ExerciseInteractorOutput {
    weak var view: ExerciseViewInput!
    var interactor: ExerciseInteractorInput!
    var router: ExerciseRouterInput!
    
    var exercise: Exercise!

    func didTapAddButton() {
        router.openEditExerciseViewController(exercise: exercise, delegate: self)
    }
    
    func getApproaches() -> [Approach] {
        return exercise.approach ?? []
    }
}

extension ExercisePresenter: EditExerciseModuleDelegate {
    
    func reloadData() {
        if let updatedExercise = interactor.update(exercise: exercise) {
            exercise = updatedExercise
        }
        view.reloadData()
    }
}
