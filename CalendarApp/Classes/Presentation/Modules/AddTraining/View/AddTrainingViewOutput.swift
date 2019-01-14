//
//  AddTrainingViewOutput.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

protocol AddTrainingViewOutput: class {

    func getExercises() -> [SectionData]
    func filterExercises(by text: String?) -> [SectionData]
    func didSelectTableViewCell(row: Int)
    func didTapAddTrainingButton()
}
