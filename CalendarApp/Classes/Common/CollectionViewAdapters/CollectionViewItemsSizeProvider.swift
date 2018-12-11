//
//  CollectionViewItemsSizeProvider.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 24.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import CoreGraphics

protocol CollectionViewItemsSizeProvider {
    static func size(for item: Any?, collectionViewSize: CGSize) -> CGSize
}
