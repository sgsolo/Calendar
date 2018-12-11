//
//  StringHelper.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 11/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import JTAppleCalendar

extension String {
    
    static func mounthWithYear(from dateSegmentInfo: DateSegmentInfo) -> String {
        guard let startDate = dateSegmentInfo.monthDates.first?.date else { return "" }
        
        let month = Calendar.current.dateComponents([.month], from: startDate).month!
        let formatter = DateFormatter()
        let monthName = formatter.monthSymbols[(month - 1) % 12]
        let year = Calendar.current.component(.year, from: startDate)
        return monthName + " " + String(year)
    }
}
