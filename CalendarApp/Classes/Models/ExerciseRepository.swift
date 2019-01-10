//
//  ExerciseRepository.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 10/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import Foundation

protocol ExerciseRepository: class {
    
    func add(exercise: Exercise)
    func getExercises(date: Date) -> [Exercise]
    func update(exercises: [Exercise])
}
