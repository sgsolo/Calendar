//
//  ExerciseRouter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import UIKit

class ExerciseRouter: BaseRouter, ExerciseRouterInput {

    func openEditExerciseModule() {
        let storyboard = try! editExerciseAssembly.resolve() as UIStoryboard
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "EditExerciseViewController") as? EditExerciseViewController else { return }
        
        self.transitionHandler.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
