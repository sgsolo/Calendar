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
    let calendarView = JTAppleCalendarView()
    
    @IBOutlet weak var daysOfWeekContainerView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func setupView() {
        super.setupView()
        
        self.view.addSubview(calendarView)
        adapter.collectionView = calendarView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let frame = self.view.frame
        let guide = self.view.safeAreaInsets
        self.calendarView.frame = CGRect(x: frame.origin.x,
                                         y: frame.origin.y + guide.top + daysOfWeekContainerView.frame.size.height,
                                         width: frame.size.width,
                                         height: frame.size.height - guide.top - guide.bottom)
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

