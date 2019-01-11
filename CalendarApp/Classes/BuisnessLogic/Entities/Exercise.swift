//
//  Exercise.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 10/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import CoreData

struct Exercise {
    
    var managedObjectID: NSManagedObjectID
    var date: Date?
    var exercise: String?
    var approach: [Approach]?
}
