//
//  DayOfWeek.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 28/09/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

enum DayOfWeek: String {
    case monday = "MONDAY"
    case tuesday = "TUESDAY"
    case wednesday = "WEDNESDAY"
    case thursday = "THURSDAY"
    case friday = "FRIDAY"
    case saturday = "SATURDAY"
    case sunday = "SUNDAY"
    
    case unrecognized = ""
}

extension DayOfWeek: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        switch rawValue.uppercased() {
        case DayOfWeek.monday.rawValue:
            self = .monday
        case DayOfWeek.tuesday.rawValue:
            self = .tuesday
        case DayOfWeek.wednesday.rawValue:
            self = .wednesday
        case DayOfWeek.thursday.rawValue:
            self = .thursday
        case DayOfWeek.friday.rawValue:
            self = .friday
        case DayOfWeek.saturday.rawValue:
            self = .saturday
        case DayOfWeek.sunday.rawValue:
            self = .sunday
        default:
            self = .unrecognized
        }
    }
}
