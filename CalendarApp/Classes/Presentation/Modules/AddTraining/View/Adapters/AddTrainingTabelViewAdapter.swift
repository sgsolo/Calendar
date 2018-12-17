//
//  AddTrainingTabelViewAdapter.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 12/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import UIKit

class AddTrainingTabelViewAdapter: BaseTableViewAdapter {
    
    override init() {
        super.init()
        self.cellClasses = [AddTrainingTableViewCell.self]
    }
}

class AddTrainingTableViewCell: UITableViewCell {}

extension AddTrainingTableViewCell: RegistrableComponent, ConfigurableComponent {
    
    func configure(with object: Any) {
        if let object = object as? String {
            self.textLabel?.text = object
        }
    }
}

