//
//  CalendarViewOutput.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Foundation

protocol CalendarViewProxyOutput: class {
    
}

protocol CalendarViewOutput: ViewLifecycleObserver {

    func didCalendarTap(date: Date)
}
