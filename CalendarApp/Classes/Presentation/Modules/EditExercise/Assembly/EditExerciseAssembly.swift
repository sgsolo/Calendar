//
//  EditExerciseAssembly.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import Foundation
import Dip

extension EditExerciseViewController: StoryboardInstantiatable {
    func didInstantiateFromStoryboard(_ container: DependencyContainer, tag: DependencyContainer.Tag?) throws {
        try editExerciseAssembly.resolveDependencies(of: self, tag: tag)
    }
}

let editExerciseAssembly = DependencyContainer { container in
    
    container.register(.unique) { UIStoryboard(name: "Main", bundle: nil) }
    
    container.register(.shared, tag: String(describing: EditExerciseViewController.self)) { EditExerciseViewController() }
        .implements(UIViewController.self,
                    EditExerciseViewInput.self)
        .resolvingProperties { container, view in
            view.output = try! container.resolve()
            view.moduleInput = view.output as? EditExerciseModuleInput
    }
    
    container.register(.shared) { EditExercisePresenter() as EditExerciseModuleInput }
        .implements(EditExerciseInteractorOutput.self,
                    EditExerciseViewOutput.self)
        .resolvingProperties { container, item in
            let presenter = item as! EditExercisePresenter 	 	
            presenter.view = try! container.resolve(tag: String(describing: EditExerciseViewController.self))
            presenter.interactor = try! container.resolve()
            presenter.router = try! container.resolve()
    }
    
    container.register(.shared) { EditExerciseInteractor() as EditExerciseInteractorInput  }
        .resolvingProperties { container, item in
	        let interactor = item as! EditExerciseInteractor
            interactor.output = try! container.resolve()
            interactor.exerciseServise = ExerciseRepositoryImp()
    }
    
    container.register(.shared) { EditExerciseRouter() as EditExerciseRouterInput }
        .resolvingProperties { container, item in
            let router = item as! EditExerciseRouter
            router.transitionHandler = try! container.resolve(tag: String(describing: EditExerciseViewController.self))
    }
}
