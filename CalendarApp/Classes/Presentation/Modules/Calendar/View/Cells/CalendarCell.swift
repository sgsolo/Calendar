//
//  CalendarCell.swift
//  MFBoard
//
//  Created by Denis Gladyshev on 14.02.18.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import JTAppleCalendar

final class CalendarCell: JTAppleCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet weak var greenCheckMarkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

extension CalendarCell: RegistrableComponent, ConfigurableComponent {
    
    func configure(with object: Any) {
        if let object = object as? CalendarCellModel {
            if object.cellState.dateBelongsTo == .thisMonth {
                dayLabel.textColor = .black
            } else {
                dayLabel.textColor = .gray
            }
            dayLabel.text = object.text
            greenCheckMarkImageView.isHidden = !object.needGreenCheckMark
        }
    }
}

struct CalendarCellModel {
    let text: String
    let cellState: CellState
    let needGreenCheckMark: Bool
}
