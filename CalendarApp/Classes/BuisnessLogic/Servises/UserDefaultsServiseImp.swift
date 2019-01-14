//
//  UserDefaultsServiseImp.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 14/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import Foundation

class UserDefaultsServiseImp: UserDefaultsServise {
    
    enum UserDefaultsKeys {
        static let exercises = "exercises"
    }
    
    func addExercise(title: String) {
        var exercises = UserDefaults.standard.stringArray(forKey: UserDefaultsKeys.exercises)
        exercises?.append(title)
        UserDefaults.standard.set(exercises, forKey: UserDefaultsKeys.exercises)
    }
    
    func getExercises() -> [String] {
        if let exercises = UserDefaults.standard.stringArray(forKey: UserDefaultsKeys.exercises) {
            return exercises
        } else {
            let exercises = ["Подтягивания",
                             "Отжимания",
                             "Брусья"]
            UserDefaults.standard.set(exercises, forKey: UserDefaultsKeys.exercises)
            return exercises
        }
    }
}
