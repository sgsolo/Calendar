//
//  ExerciseRepository.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 10/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import CoreData

protocol ExerciseRepository: class {
    
    func add(exercise: String, date: Date)
    func getExercises(date: Date) -> [Exercise]
    func getExercises(managedObjectID: NSManagedObjectID) -> Exercise?
    func update(exercise: Exercise)
}
