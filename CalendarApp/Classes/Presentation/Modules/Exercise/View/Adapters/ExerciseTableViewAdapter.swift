//
//  ExerciseTableViewAdapter.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 10/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import UIKit

class ExerciseTableViewAdapter: BaseTableViewAdapter {
    
    override init() {
        super.init()
        self.cellClasses = [ExerciseTabelViewCell.self]
    }
}
