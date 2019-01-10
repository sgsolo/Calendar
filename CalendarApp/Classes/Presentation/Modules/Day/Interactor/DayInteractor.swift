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
    var coreDataRepository: CoreDataRepository!
    
    func add(exercise: String, date: Date) {
        let context = coreDataStore.persistentContainer.viewContext
        let exerciseEntity = ExerciseEntity(context: context)
        exerciseEntity.date = date
        exerciseEntity.exercise = exercise
        coreDataRepository.add(exercise: exerciseEntity)
    }
    
    func getExecises(date: Date) -> [String] {
        let exercises = coreDataRepository.getExercises(date: date).compactMap { $0.exercise }
        return exercises
    }
    
}
