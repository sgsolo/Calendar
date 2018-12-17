//
//  CoreDataRepository.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 13/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import Foundation

protocol CoreDataRepository: class {
    
    func add(exercise: ExerciseEntity)
    func getExercises() -> [ExerciseEntity]
    func update(exercises: [ExerciseEntity])
}
