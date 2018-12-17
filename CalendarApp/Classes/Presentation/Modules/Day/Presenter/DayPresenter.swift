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
}

extension DayPresenter: DayViewOutput {
    
    func getExercises() -> [SectionData] {
        return getSectionData(objects: interactor.getExecises())
    }
    
    private func getSectionData(objects: [Any]) -> [SectionData] {
        return [SectionData(objects: objects)]
    }
    
    func didTapNavigationItem() {
        router.popViewController()
    }
    
    func didTapNewItem() {
        router.openNewViewController()
    }
}

extension DayPresenter: AddTrainingModuleDelegate {
    
    func didSelect(exercise: String) {
        interactor.add(exercise: exercise)
    }
}
