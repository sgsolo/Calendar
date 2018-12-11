//
//  ShowAlertRouterInput.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 16/10/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

protocol ShowAlertRouterInput: class {
    func showAlert(with configuration: AlertConfiguration)
}

struct AlertConfiguration {
    struct Button {
        let title: String
        let subTitle: String
        let action: (() -> Void)?
        
        init(title: String, subTitle:String, action: (() -> Void)? = nil) {
            self.title = title
            self.subTitle = subTitle
            self.action = action
        }
    }
}
