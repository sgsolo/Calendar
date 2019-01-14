//
//  UserDefaultsServise.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 14/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import Foundation

enum UserDefaultsError: Error {
    case userDefaultsError(String)
}

protocol UserDefaultsServise {
    
    func addExercise(title: String) throws
    func getExercises() -> [String]
}
