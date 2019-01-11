//
//  EditExerciseInteractor.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import Foundation

class EditExerciseInteractor: NSObject, EditExerciseInteractorInput {

    weak var output: EditExerciseInteractorOutput!
    var exerciseServise: ExerciseRepository!
    
    func save(exercise: Exercise) {
        exerciseServise.update(exercise: exercise)
    }
}
