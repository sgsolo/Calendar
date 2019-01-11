//
//  ExerciseInteractorInput.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

protocol ExerciseInteractorInput: class {

    func update(exercise: Exercise) -> Exercise?
}
