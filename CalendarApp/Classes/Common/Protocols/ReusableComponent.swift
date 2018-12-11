//
//  ReusableComponent.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 24.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

protocol ReusableComponent {
    static var identifier: String { get }
}

import UIKit

extension ReusableComponent where Self: UIView {
    static var identifier: String {
        return String(describing: self.classForCoder())
    }
}
