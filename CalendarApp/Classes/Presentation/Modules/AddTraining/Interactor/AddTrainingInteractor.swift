//
//  AddTrainingInteractor.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class AddTrainingInteractor: NSObject, AddTrainingInteractorInput {

    weak var output: AddTrainingInteractorOutput!
    var userDefaultsServise: UserDefaultsServise!
 
    func addExercise(title: String) {
        userDefaultsServise.addExercise(title: title)
    }
    
    func getExercises() -> [String] {
        return userDefaultsServise.getExercises()
    }
}
