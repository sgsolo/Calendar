//
//  CellWithCollection.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 02/10/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

protocol CellWithCollection: class {
    var didTapCollectionItem: ((IndexPath) -> Void)? { get set }
}
