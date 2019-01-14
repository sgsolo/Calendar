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
    
    func popViewController()
}

class BaseRouter: RouterTrait {
    
    weak var transitionHandler: UIViewController!
    
    func popViewController() {
        transitionHandler.navigationController?.popViewController(animated: true)
    }
}

enum ActionStyle {
    case `default`
    case cancel
    case destructive
    
    var style: UIAlertAction.Style {
        switch self {
        case .default: return .default
        case .destructive: return .destructive
        case .cancel: return .cancel
        }
    }
    init(style: UIAlertAction.Style) {
        switch style {
        case .default: self = .default
        case .destructive: self = .destructive
        case .cancel: self = .cancel
        }
    }
}

struct AlertAction {
    let title: String?
    let style: ActionStyle
    let handler: ((AlertAction) -> Void)?
    let textFieldHandler: ((String?) -> Void)?
}

struct AlertConfig {
    let title: String?
    let message: String?
    let inputPlaceholder: String?
    let inputKeyboardType: UIKeyboardType = .default
    let alertStyle: UIAlertController.Style
    let actions: [AlertAction]
}

protocol ShowAlertInput: class {
    func showAlert(config: AlertConfig)
    func showAlert(title: String?,
                   subtitle: String?,
                   actionTitle: String?,
                   cancelTitle: String?,
                   inputPlaceholder: String?,
                   inputKeyboardType: UIKeyboardType,
                   cancelHandler: ((UIAlertAction) -> Void)?,
                   actionHandler: ((_ text: String?) -> Void)?)
}

extension ShowAlertInput {
    func showAlert(title: String? = nil,
                   subtitle: String? = nil,
                   actionTitle: String? = "Add",
                   cancelTitle: String? = "Cancel",
                   inputPlaceholder: String? = nil,
                   inputKeyboardType: UIKeyboardType = UIKeyboardType.default,
                   cancelHandler: ((UIAlertAction) -> Void)? = nil,
                   actionHandler: ((_ text: String?) -> Void)? = nil) {
        self.showAlert(title: title, subtitle: subtitle, actionTitle: actionTitle, cancelTitle: cancelTitle, inputPlaceholder: inputPlaceholder, inputKeyboardType: inputKeyboardType, cancelHandler: cancelHandler, actionHandler: actionHandler)
    }
}

protocol ShowAlertTrait: ShowAlertInput, RouterTrait {}

extension ShowAlertTrait {
    func showAlert(config: AlertConfig) {
        let alert = UIAlertController(title: config.title, message: config.message, preferredStyle: config.alertStyle)
        config.actions.forEach { (action) in
            alert.addAction(UIAlertAction(title: action.title, style: action.style.style, handler: { _ in
                action.handler?(action)
            }))
        }
        self.transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String? = nil,
                   subtitle: String? = nil,
                   actionTitle: String? = "Add",
                   cancelTitle: String? = "Cancel",
                   inputPlaceholder: String? = nil,
                   inputKeyboardType: UIKeyboardType = UIKeyboardType.default,
                   cancelHandler: ((UIAlertAction) -> Void)? = nil,
                   actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (action:UIAlertAction) in
            guard let textField = alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.transitionHandler.present(alert, animated: true, completion: nil)
    }
}
