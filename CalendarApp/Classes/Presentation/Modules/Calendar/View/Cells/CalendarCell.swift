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
    @IBOutlet var selectedView: UIView!
    @IBOutlet var meetingDayMarkView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectedView.isHidden = true
        self.selectedView.layer.cornerRadius = self.selectedView.bounds.width / 2
        
        self.meetingDayMarkView.isHidden = true
        self.meetingDayMarkView.layer.borderColor = UIColor.darkGray.cgColor
        self.meetingDayMarkView.layer.borderWidth = 1
        self.meetingDayMarkView.layer.cornerRadius = self.meetingDayMarkView.bounds.width / 2
    }
}

extension CalendarCell: RegistrableComponent {}
