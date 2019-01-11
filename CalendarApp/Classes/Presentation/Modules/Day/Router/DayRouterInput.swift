//
//  DayRouterInput.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

protocol DayRouterInput: BaseRouterInput {

    func openAddTrainingViewController()
    func openExerciseViewController(exercise: Exercise)
}
