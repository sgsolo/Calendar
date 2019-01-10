//
//  DayViewOutput.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

protocol DayViewOutput: ViewLifecycleObserver {

    func getExercises() -> [SectionData]
    func didTapNavigationItem()
    func didTapNewItem()
    func didSelectExercise(index: Int)
}
