//
//  ExerciseRepositoryImp.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 10/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import CoreData

class ExerciseRepositoryImp: ExerciseRepository {
    
    let context = coreDataStore.persistentContainer.viewContext
    
    func add(exercise: Exercise) {
        let context = coreDataStore.persistentContainer.viewContext
        let exerciseEntity = ExerciseEntity(context: context)
        exerciseEntity.date = exercise.date
        exerciseEntity.exercise = exercise.exercise
        context.insert(exerciseEntity)
        coreDataStore.saveContext()
    }
    
    func getExercises(date: Date) -> [Exercise] {
        let predicate = NSPredicate(format: "date = %@", date as CVarArg)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: ExerciseEntity.self))
        request.predicate = predicate
        if let exercises = try? context.fetch(request) as? [ExerciseEntity] {
            return exercises?.map { Exercise(date: $0.date, exercise: $0.exercise, approach: $0.approach) } ?? []
        }
        return []
    }
    
    func update(exercises: [Exercise]) {
        
    }
    
    func delete(exercise: Exercise) {
        coreDataStore.saveContext()
    }
}
