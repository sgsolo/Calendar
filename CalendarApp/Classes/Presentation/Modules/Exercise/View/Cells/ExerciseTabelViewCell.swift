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
    @IBOutlet weak var dateLabel: UILabel!
    
}

extension ExerciseTabelViewCell: RegistrableComponent, ConfigurableComponent {
    
    func configure(with object: Any) {
        if let object = object as? Approach,
            let extraWeight = object.extraWeight,
            let quantity = object.quantity,
            let addedDate = object.addedDate {
            self.quantityLabel?.text = String(quantity)
            self.extraWeight?.text = String(extraWeight)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss"
            self.dateLabel?.text = dateFormatter.string(from: addedDate)
        }
    }
}

extension RegistrableComponent where Self: ExerciseTabelViewCell {
    static var registrableSource: RegistrableSource {
        let bundle = Bundle(for: self.classForCoder())
        return .nib(UINib(nibName: String(describing: self.classForCoder()), bundle: bundle))
    }
}
