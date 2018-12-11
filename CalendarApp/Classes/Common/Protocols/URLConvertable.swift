//
//  URLConvertable.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 28/09/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

protocol URLConvertable {
    func buildURL() -> URL?
}
