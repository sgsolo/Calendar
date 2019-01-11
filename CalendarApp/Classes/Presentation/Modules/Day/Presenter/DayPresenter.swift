//
//  DayPresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class DayPresenter: NSObject, DayModuleInput, DayInteractorOutput {

    weak var view: DayViewInput!
    var interactor: DayInteractorInput!
    var router: DayRouterInput!
    
    var date: Date!
    
    func setDate(_ date: Date) {
        self.date = date
    }
    
    func viewWillAppear() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" 
        let dateString = dateFormatter.string(from: date)
        view.setTitle(dateString)
        view.updateData()
    }
}

extension DayPresenter: DayViewOutput {
    
    func getExercises() -> [SectionData] {
        return getSectionData(objects: interactor.getExecises(date: date))
    }
    
    private func getSectionData(objects: [Any]) -> [SectionData] {
        return [SectionData(objects: objects)]
    }
    
    func didTapNavigationItem() {
        router.popViewController()
    }
    
    func didTapNewItem() {
        router.openAddTrainingViewController()
    }
    
    func didSelectExercise(index: Int) {
        let execises = interactor.getExecises(date: date)
        if index < execises.count {
            router.openExerciseViewController(exercise: execises[index])
        }
    }
}

extension DayPresenter: AddTrainingModuleDelegate {
    
    func didSelect(exercise: String) {
        interactor.add(exercise: exercise, date: date)
    }
}
