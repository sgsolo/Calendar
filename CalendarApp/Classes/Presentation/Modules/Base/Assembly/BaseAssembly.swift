//
//  BaseAssembly.swift
//  CalendarApp
//
//  Created by Calendar App on 27/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation
import Dip

extension BaseViewController: StoryboardInstantiatable {
    func didInstantiateFromStoryboard(_ container: DependencyContainer, tag: DependencyContainer.Tag?) throws {
        try baseAssembly.resolveDependencies(of: self, tag: tag)
    }
}

let baseAssembly = DependencyContainer { container in
    
    container.register(.shared, tag: String(describing: BaseViewController.self)) { BaseViewController() }
        .implements(UIViewController.self,
                    BaseViewInput.self)
        .resolvingProperties { container, view in
            view.output = try! container.resolve()
            view.moduleInput = view.output as? BaseModuleInput
    }
    
    container.register(.shared) { BasePresenter() as BaseModuleInput }
        .implements(BaseInteractorOutput.self,
                    BaseViewOutput.self)
        .resolvingProperties { container, item in
            let presenter = item as! BasePresenter 	 	
            presenter.view = try! container.resolve(tag: String(describing: BaseViewController.self))
            presenter.interactor = try! container.resolve()
            presenter.router = try! container.resolve()
    }
    
    container.register(.shared) { BaseInteractor() as BaseInteractorInput  }
        .resolvingProperties { container, item in
	        let interactor = item as! BaseInteractor
            interactor.output = try! container.resolve()
    }
    
    container.register(.shared) { BaseRouter() as BaseRouterInput }
        .resolvingProperties { container, item in
            let router = item as! BaseRouter
            router.transitionHandler = try! container.resolve(tag: String(describing: BaseViewController.self))
    }
}
