//
//  CalendarAssembly.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation
import Dip

extension CalendarViewController: StoryboardInstantiatable {
    func didInstantiateFromStoryboard(_ container: DependencyContainer, tag: DependencyContainer.Tag?) throws {
        try calendarAssembly.resolveDependencies(of: self, tag: tag)
    }
}

let calendarAssembly = DependencyContainer { container in
    
    container.register(.shared, tag: String(describing: CalendarViewController.self)) { CalendarViewController() }
        .implements(UIViewController.self,
                    CalendarViewInput.self)
        .resolvingProperties { container, view in
            view.output = try! container.resolve()
            view.moduleInput = view.output as! CalendarModuleInput
    }
    
    container.register(.shared) { CalendarPresenter() as CalendarModuleInput }
        .implements(CalendarInteractorOutput.self,
                    CalendarViewOutput.self)
        .resolvingProperties { container, item in
            let presenter = item as! CalendarPresenter 	 	
            presenter.view = try! container.resolve(tag: String(describing: CalendarViewController.self))
            presenter.interactor = try! container.resolve()
            presenter.router = try! container.resolve()
    }
    
    container.register(.shared) { CalendarInteractor() as CalendarInteractorInput  }
        .resolvingProperties { container, item in
	        let interactor = item as! CalendarInteractor
            interactor.output = try! container.resolve()
    }
    
    container.register(.shared) { CalendarRouter() as CalendarRouterInput }
        .resolvingProperties { container, item in
            let router = item as! CalendarRouter
            router.transitionHandler = try! container.resolve(tag: String(describing: CalendarViewController.self))
    }
}
