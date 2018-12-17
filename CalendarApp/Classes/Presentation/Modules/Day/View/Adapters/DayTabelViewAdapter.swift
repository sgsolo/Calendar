//
//  DayTabelViewAdapter.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 13/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import UIKit

class DayTabelViewAdapter: BaseTableViewAdapter {
    
    override init() {
        super.init()
        self.cellClasses = [DayTabelViewCell.self]
    }
}

class DayTabelViewCell: UITableViewCell {}

extension DayTabelViewCell: RegistrableComponent, ConfigurableComponent {
    
    func configure(with object: Any) {
        if let object = object as? String {
            self.textLabel?.text = object
        }
    }
}

