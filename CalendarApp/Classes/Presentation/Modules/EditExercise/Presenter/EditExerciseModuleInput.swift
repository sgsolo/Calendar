//
//  EditExerciseModuleInput.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

protocol EditExerciseModuleDelegate: class {
    
    func reloadData()
}

protocol EditExerciseModuleInput: class {

    var exercise: Exercise! { get set }
    var delegate: EditExerciseModuleDelegate! { get set }
}
