//
//  ExerciseAssembly.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import Foundation
import Dip

extension ExerciseViewController: StoryboardInstantiatable {
    func didInstantiateFromStoryboard(_ container: DependencyContainer, tag: DependencyContainer.Tag?) throws {
        try exerciseAssembly.resolveDependencies(of: self, tag: tag)
    }
}

let exerciseAssembly = DependencyContainer { container in
    
    container.register(.unique) { UIStoryboard(name: "Main", bundle: nil) }
    
    container.register(.shared, tag: String(describing: ExerciseViewController.self)) { ExerciseViewController() }
        .implements(UIViewController.self,
                    ExerciseViewInput.self)
        .resolvingProperties { container, view in
            view.output = try! container.resolve()
            view.moduleInput = view.output as? ExerciseModuleInput
            view.adapter = ExerciseTableViewAdapter()
    }
    
    container.register(.shared) { ExercisePresenter() as ExerciseModuleInput }
        .implements(ExerciseInteractorOutput.self,
                    ExerciseViewOutput.self)
        .resolvingProperties { container, item in
            let presenter = item as! ExercisePresenter 	 	
            presenter.view = try! container.resolve(tag: String(describing: ExerciseViewController.self))
            presenter.interactor = try! container.resolve()
            presenter.router = try! container.resolve()
    }
    
    container.register(.shared) { ExerciseInteractor() as ExerciseInteractorInput  }
        .resolvingProperties { container, item in
	        let interactor = item as! ExerciseInteractor
            interactor.output = try! container.resolve()
            interactor.exerciseRepository = ExerciseRepositoryImp()
    }
    
    container.register(.shared) { ExerciseRouter() as ExerciseRouterInput }
        .resolvingProperties { container, item in
            let router = item as! ExerciseRouter
            router.transitionHandler = try! container.resolve(tag: String(describing: ExerciseViewController.self))
    }
}
