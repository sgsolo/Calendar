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
    
    func add(exercise: String, date: Date) {
        let exerciseEntity = ExerciseEntity(context: context)
        exerciseEntity.date = date
        exerciseEntity.exercise = exercise
        context.insert(exerciseEntity)
        coreDataStore.saveContext()
    }
    
    func getExercises(date: Date) -> [Exercise] {
        let predicate = NSPredicate(format: "date = %@", date as CVarArg)
        let exercises = getExerciseEntity(predicate: predicate)
        return exercises?.map { Exercise(managedObjectID: $0.objectID, date: $0.date, exercise: $0.exercise, approach: self.map(approachEntities: $0.approach)) } ?? []
    }
    
    func getExercises(managedObjectID: NSManagedObjectID) -> Exercise? {
        guard let exerciseEntity = context.object(with: managedObjectID) as? ExerciseEntity else { return nil }
        return Exercise(managedObjectID: exerciseEntity.objectID,
                        date: exerciseEntity.date,
                        exercise: exerciseEntity.exercise,
                        approach: self.map(approachEntities: exerciseEntity.approach))
    }
    
    func update(exercise: Exercise) {
        if let exerciseEntity = context.object(with: exercise.managedObjectID) as? ExerciseEntity {
            let approachEntity = ApproachEntity(context: context)
            for approach in exercise.approach ?? [] {
                approachEntity.quantity = Int16(approach.quantity!)
                approachEntity.extraWeight = Int16(approach.extraWeight!)
                approachEntity.addedDate = Date()
                approachEntity.exercise = exerciseEntity
                exerciseEntity.addToApproach(approachEntity)
                coreDataStore.saveContext()
            }
        }
    }
    
    func delete(exercise: Exercise) {
        coreDataStore.saveContext()
    }
    
    private func getExerciseEntity(objectID: NSManagedObjectID) -> [ExerciseEntity]? {
        let predicate = NSPredicate(format: "objectID = %@", objectID as CVarArg)
        let request: NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        request.predicate = predicate
        return try? context.fetch(request)
    }
    
    private func getExerciseEntity(predicate: NSPredicate) -> [ExerciseEntity]? {
        let request: NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        request.predicate = predicate
        return try? context.fetch(request)
    }
    
    private func map(approachEntities: NSSet?) -> [Approach] {
        var approaches: [Approach] = []
        guard let approachEntities = approachEntities else { return [] }
        
        for approachEntity in approachEntities {
            guard let approachEntity = approachEntity as? ApproachEntity else { continue }
            let approach = Approach(addedDate: approachEntity.addedDate,
                                    quantity: Int(approachEntity.quantity),
                                    extraWeight: Int(approachEntity.extraWeight))
            approaches.append(approach)
        }
        return approaches
    }
}
