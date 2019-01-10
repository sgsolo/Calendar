//
//  DayRouter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

final class DayRouter: BaseRouter, DayRouterInput {
    
    func openAddTrainingViewController() {
        let storyboard = try! addTrainingAssembly.resolve() as UIStoryboard
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "AddTrainingViewController") as? AddTrainingViewController else { return }
        (destinationViewController.moduleInput as? AddTrainingModuleInput)?.delegate = self.trainingDelegate
        
        self.transitionHandler.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    func openExerciseViewController() {
        let storyboard = try! exerciseAssembly.resolve() as UIStoryboard
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ExerciseViewController") as? ExerciseViewController else { return }
//        (destinationViewController.moduleInput as? AddTrainingModuleInput)?.delegate = self.trainingDelegate
        
        self.transitionHandler.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}

extension DayRouter {
    var trainingDelegate: AddTrainingModuleDelegate? {
        return (self.transitionHandler as? BaseViewController)?.moduleInput as? AddTrainingModuleDelegate
    }
}
