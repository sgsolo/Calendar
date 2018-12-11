//
//  ConfigurableComponent.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 24.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

protocol ConfigurableComponent {
    func configure(with object: Any)
}
