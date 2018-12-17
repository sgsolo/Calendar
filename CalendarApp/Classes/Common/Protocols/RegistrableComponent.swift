//
//  RegistrableComponent.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 24.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

protocol RegistrableComponent: ReusableComponent {
    static var registrableSource: RegistrableSource { get }
}

extension RegistrableComponent where Self: UIView {
    static var registrableSource: RegistrableSource {
        let bundle = Bundle(for: self.classForCoder())
        return .nib(UINib(nibName: String(describing: self.classForCoder()), bundle: bundle))
    }
}

extension RegistrableComponent where Self: UITableViewCell {
    static var registrableSource: RegistrableSource {
        return .class
    }
}
