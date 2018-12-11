//
//  NetworkServiceError.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 25.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

struct NetworkServiceError {
    let type: NetworkServiceType
    let error: Error
}

enum NetworkServiceType {
    case networkError
    case wrongResponse
    case cancelled
}
