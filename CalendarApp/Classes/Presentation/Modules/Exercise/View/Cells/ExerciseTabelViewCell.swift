//
//  Excercise.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 10/01/2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import UIKit

class ExerciseTabelViewCell: UITableViewCell {
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var extraWeight: UILabel!
    
}

extension ExerciseTabelViewCell: RegistrableComponent, ConfigurableComponent {
    
    func configure(with object: Any) {
        if let object = object as? Approach, let extraWeight = object.extraWeight {
            self.textLabel?.text = String(extraWeight)
        }
    }
}
