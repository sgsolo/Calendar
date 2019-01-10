//
//  DayAssembly.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation
import Dip

extension DayViewController: StoryboardInstantiatable {
    func didInstantiateFromStoryboard(_ container: DependencyContainer, tag: DependencyContainer.Tag?) throws {
        try dayAssembly.resolveDependencies(of: self, tag: tag)
    }
}

let dayAssembly = DependencyContainer { container in
    
    container.register(.unique) { UIStoryboard(name: "Main", bundle: nil) }
    
    container.register(.shared, tag: String(describing: DayViewController.self)) { DayViewController() }
        .implements(UIViewController.self,
                    DayViewInput.self)
        .resolvingProperties { container, view in
            view.output = try! container.resolve()
            view.moduleInput = view.output as? DayModuleInput
            let adapter = DayTabelViewAdapter()
            adapter.output = view
            view.adapter = adapter
    }
    
    container.register(.shared) { DayPresenter() as DayModuleInput }
        .implements(DayInteractorOutput.self,
                    DayViewOutput.self)
        .resolvingProperties { container, item in
            let presenter = item as! DayPresenter 	 	
            presenter.view = try! container.resolve(tag: String(describing: DayViewController.self))
            presenter.interactor = try! container.resolve()
            presenter.router = try! container.resolve()
    }
    
    container.register(.shared) { DayInteractor() as DayInteractorInput  }
        .resolvingProperties { container, item in
	        let interactor = item as! DayInteractor
            interactor.output = try! container.resolve()
            interactor.exerciseRepository = ExerciseRepositoryImp()
    }
    
    container.register(.shared) { DayRouter() as DayRouterInput }
        .resolvingProperties { container, item in
            let router = item as! DayRouter
            router.transitionHandler = try! container.resolve(tag: String(describing: DayViewController.self))
    }
}
