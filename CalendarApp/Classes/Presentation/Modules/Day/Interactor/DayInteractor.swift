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
        var exerciseEntity = Exercise()
        exerciseEntity.date = date
        exerciseEntity.exercise = exercise
        exerciseRepository.add(exercise: exerciseEntity)
    }
    
    func getExecises(date: Date) -> [String] {
        let exercises = exerciseRepository.getExercises(date: date).compactMap { $0.exercise }
        return exercises
    }
    
    func getExecisesEntity(date: Date) -> [String] {
        let exercises = exerciseRepository.getExercises(date: date).compactMap { $0.exercise }
        return exercises
    }
    
}
