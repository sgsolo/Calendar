//
//  ExerciseInteractor.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import Foundation

class ExerciseInteractor: NSObject, ExerciseInteractorInput {

    weak var output: ExerciseInteractorOutput!
    var  exerciseRepository: ExerciseRepository!
    
    func update(exercise: Exercise) -> Exercise? {
        return exerciseRepository.getExercises(managedObjectID: exercise.managedObjectID)
    }
}
