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
    
    func getExercises() -> [SectionData] {
        return getSectionData(objects: interactor.getExercises())
    }
    
    func filterExercises(by text: String?) -> [SectionData] {
        if let text = text, !text.isEmpty {
            return getSectionData(objects: interactor.getExercises().filter { $0.lowercased().contains(text.lowercased()) })
        }
        return getSectionData(objects: interactor.getExercises())
    }
    
    func didSelectTableViewCell(row: Int) {
        let exercises = interactor.getExercises()
        if row < exercises.count {
            let exercise = exercises[row]
            delegate?.didSelect(exercise: exercise)
        }
        router.popViewController()
    }
    
    func didTapAddTrainingButton() {
        view.dissmissSearchViewControllerIfNeeded()
        router.showAlert(title: "Добавьте упражнение", actionHandler: { [weak self] text in
            guard let text = text else { return }
            do {
                try self?.interactor.addExercise(title: text)
            } catch UserDefaultsError.userDefaultsError(let errorMessage) {
                self?.router.showAlert(config: AlertConfig(title: errorMessage, message: nil, inputPlaceholder: nil, alertStyle: .alert, actions: [AlertAction(title: "OK", style: .default, handler: nil)]))
            } catch {}
            
            
        })
    }
    
    private func getSectionData(objects: [Any]) -> [SectionData] {
        return [SectionData(header: "Exercises", objects: objects)]
    }
}
