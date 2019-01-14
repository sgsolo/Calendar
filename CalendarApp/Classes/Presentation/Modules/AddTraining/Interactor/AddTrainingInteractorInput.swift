//
//  AddTrainingInteractorInput.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

protocol AddTrainingInteractorInput: class {

    
    func addExercise(title: String)
    func getExercises() -> [String]
}
