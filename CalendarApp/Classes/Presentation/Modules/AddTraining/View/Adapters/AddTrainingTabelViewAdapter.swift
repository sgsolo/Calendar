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
        self.cellClasses = [UITableViewCell.self]
        
        self.tableSections = [SectionData(objects: ["training"])]
    }
    
//    override func cellClass(for model: Any) -> RegistrableComponent.Type? {
//        return UITableViewCell.self
//    }
    
}

extension UITableViewCell: RegistrableComponent {}
