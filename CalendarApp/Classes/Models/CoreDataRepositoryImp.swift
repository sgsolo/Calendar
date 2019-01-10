//
//  CoreDataRepositoryImp.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 13/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import CoreData

class CoreDataRepositoryImp: CoreDataRepository {
    
    let context = coreDataStore.persistentContainer.viewContext
    
    func add(exercise: ExerciseEntity) {
        context.insert(exercise)
        coreDataStore.saveContext()
    }
    
    func getExercises(date: Date) -> [ExerciseEntity] {
        let predicate = NSPredicate(format: "date = %@", date as CVarArg)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: ExerciseEntity.self))
        request.predicate = predicate
        if let exercises = try? context.fetch(request) as? [ExerciseEntity] {
            return exercises ?? []
        }
        return []
    }
    
    func update(exercises: [ExerciseEntity]) {
        
    }
    
    func delete(exercise: ExerciseEntity) {
        coreDataStore.saveContext()
    }
}
