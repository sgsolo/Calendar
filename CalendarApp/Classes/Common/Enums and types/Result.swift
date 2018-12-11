//
//  ServiceCompletionBlock.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 01/10/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

enum Result<ResultType, ErrorType> {
    case success(ResultType)
    case failure(ErrorType)
}
