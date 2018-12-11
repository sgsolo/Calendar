//
//  Month.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 28/09/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

enum Month: String {
    case january = "JANUARY"
    case february = "FEBRUARY"
    case march = "MARCH"
    case april = "APRIL"
    case may = "MAY"
    case june = "JUNE"
    case july = "JULY"
    case august = "AUGUST"
    case september = "SEPTEMBER"
    case october = "OCTOBER"
    case november = "NOVEMBER"
    case december = "DECEMBER"
    
    case unrecognized = ""
}

extension Month: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        switch rawValue.uppercased() {
        case Month.january.rawValue:
            self = .january
        case Month.february.rawValue:
            self = .february
        case Month.march.rawValue:
            self = .march
        case Month.april.rawValue:
            self = .april
        case Month.may.rawValue:
            self = .may
        case Month.june.rawValue:
            self = .june
        case Month.july.rawValue:
            self = .july
        case Month.august.rawValue:
            self = .august
        case Month.september.rawValue:
            self = .september
        case Month.october.rawValue:
            self = .october
        case Month.november.rawValue:
            self = .november
        case Month.december.rawValue:
            self = .december
        default:
            self = .unrecognized
        }
    }
}
