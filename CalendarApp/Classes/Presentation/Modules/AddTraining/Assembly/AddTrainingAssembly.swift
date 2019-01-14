//
//  AddTrainingAssembly.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation
import Dip

extension AddTrainingViewController: StoryboardInstantiatable {
    func didInstantiateFromStoryboard(_ container: DependencyContainer, tag: DependencyContainer.Tag?) throws {
        try addTrainingAssembly.resolveDependencies(of: self, tag: tag)
    }
}

let addTrainingAssembly = DependencyContainer { container in
    
    container.register(.unique) { UIStoryboard(name: "Main", bundle: nil) }
    
    container.register(.shared, tag: String(describing: AddTrainingViewController.self)) { AddTrainingViewController() }
        .implements(UIViewController.self,
                    AddTrainingViewInput.self)
        .resolvingProperties { container, view in
            view.output = try! container.resolve()
            view.moduleInput = view.output as? AddTrainingModuleInput
            let adapter = AddTrainingTabelViewAdapter()
            adapter.output = view
            view.adapter = adapter
    }
    
    container.register(.shared) { AddTrainingPresenter() as AddTrainingModuleInput }
        .implements(AddTrainingInteractorOutput.self,
                    AddTrainingViewOutput.self)
        .resolvingProperties { container, item in
            let presenter = item as! AddTrainingPresenter 	 	
            presenter.view = try! container.resolve(tag: String(describing: AddTrainingViewController.self))
            presenter.interactor = try! container.resolve()
            presenter.router = try! container.resolve()
    }
    
    container.register(.shared) { AddTrainingInteractor() as AddTrainingInteractorInput  }
        .resolvingProperties { container, item in
	        let interactor = item as! AddTrainingInteractor
            interactor.output = try! container.resolve()
            interactor.userDefaultsServise = UserDefaultsServiseImp()
    }
    
    container.register(.shared) { AddTrainingRouter() as AddTrainingRouterInput }
        .resolvingProperties { container, item in
            let router = item as! AddTrainingRouter
            router.transitionHandler = try! container.resolve(tag: String(describing: AddTrainingViewController.self))
    }
}
