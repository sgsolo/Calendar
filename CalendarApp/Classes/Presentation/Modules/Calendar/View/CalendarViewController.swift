//
//  CalendarViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import JTAppleCalendar

class CalendarViewController: BaseViewController, CalendarViewInput {

    var output: CalendarViewOutput!
    var adapter: CalendarCollectionViewAdapterInput!

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var daysOfWeekContainerView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func setupView() {
        super.setupView()
        
        adapter.collectionView = calendarView
    }
    
    @IBAction func prevButtonTap(_ sender: Any) {
        adapter.scrollToSegment(.previous)
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        adapter.scrollToSegment(.next)
    }
    
}

extension CalendarViewController: CalendarCollectionViewAdapterOutput {
    
    func didScrollToDateSegment(visibleDates: DateSegmentInfo) {
        self.monthLabel.text = String.mounthWithYear(from: visibleDates)
    }
    
    func didCalendarTap(date: Date) {
        output.didCalendarTap(date: date)
    }
}

