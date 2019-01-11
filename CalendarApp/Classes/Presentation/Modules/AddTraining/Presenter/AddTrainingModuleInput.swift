//
//  AddTrainingModuleInput.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

protocol AddTrainingModuleDelegate: class {
    
    func didSelect(exercise: String)
}

protocol AddTrainingModuleInput: class {

    var delegate: AddTrainingModuleDelegate? { get set }
}
