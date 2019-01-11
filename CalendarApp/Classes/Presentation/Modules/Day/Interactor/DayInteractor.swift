//
//  DayInteractor.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class DayInteractor: NSObject, DayInteractorInput {

    weak var output: DayInteractorOutput!
    var exerciseRepository: ExerciseRepository!
    
    func add(exercise: String, date: Date) {
        exerciseRepository.add(exercise: exercise, date: date)
    }
    
    func getExecises(date: Date) -> [Exercise] {
        return exerciseRepository.getExercises(date: date)
    }
    
}
