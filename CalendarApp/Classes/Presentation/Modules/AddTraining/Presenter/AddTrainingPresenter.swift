//
//  AddTrainingPresenter.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

class AddTrainingPresenter: NSObject, AddTrainingModuleInput, AddTrainingViewOutput, AddTrainingInteractorOutput {

    weak var view: AddTrainingViewInput!
    var interactor: AddTrainingInteractorInput!
    var router: AddTrainingRouterInput!
    
    weak var delegate: AddTrainingModuleDelegate?
    let exercises = ["Подтягивания",
                     "Отжимания",
                     "Брусья"]
    
    func getExercises() -> [SectionData] {
        return getSectionData(objects: exercises)
    }
    
    func filterExercises(by text: String?) -> [SectionData] {
        if let text = text, !text.isEmpty {
            return getSectionData(objects: exercises.filter { $0.lowercased().contains(text.lowercased()) })
        }
        return getSectionData(objects: exercises)
    }
    
    func didSelectTableViewCell(row: Int) {
        if row < exercises.count {
            let exercise = exercises[row]
            delegate?.didSelect(exercise: exercise)
        }
        router.popViewController()
    }
    
    private func getSectionData(objects: [Any]) -> [SectionData] {
        return [SectionData(header: "Exercises", objects: objects)]
    }
}
