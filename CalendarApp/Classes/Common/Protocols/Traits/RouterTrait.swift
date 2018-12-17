//
//  RouterTrait.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 17/10/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

protocol RouterTrait: class {
    var transitionHandler: UIViewController! { get set }
}

protocol BaseRouterInput: class {
    
    func popViewController()
}

class BaseRouter: RouterTrait {
    
    weak var transitionHandler: UIViewController!
    
    func popViewController() {
        transitionHandler.navigationController?.popViewController(animated: true)
    }
}
