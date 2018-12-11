//
//  ImageSource.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 16/10/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

enum ImageSource {
    case url(URL)
    case name(String)
}

extension ImageSource: Equatable {}
