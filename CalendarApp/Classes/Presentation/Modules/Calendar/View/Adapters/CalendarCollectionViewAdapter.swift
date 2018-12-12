//
//  CalendarCollectionViewAdapter.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 11/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import JTAppleCalendar

protocol CalendarCollectionViewAdapterOutput: BaseCollectionViewAdapterOutput {
    
    func didScrollToDateSegment(visibleDates: DateSegmentInfo)
    func didCalendarTap(date: Date)
}

protocol CalendarCollectionViewAdapterInput: BaseCollectionViewAdpaterInput {
    
    func scrollToSegment(_ destination: SegmentDestination)
}

class CalendarCollectionViewAdapter: BaseCollectionViewAdapter {
    
    private var calendarOutput: CalendarCollectionViewAdapterOutput? {
        return self.output as? CalendarCollectionViewAdapterOutput
    }
    
    var calendarView: JTAppleCalendarView?
    override var collectionView: UICollectionView? {
        get {
            return calendarView
        }
        set {
            calendarView = newValue as? JTAppleCalendarView
            self.prepareCollectionView()
        }
    }
    
    override init() {
        super.init()
        self.cellClasses = [CalendarCell.self]
    }
    
    override func prepareCollectionView() {
        super.prepareCollectionView()
        calendarView?.calendarDelegate = self
        calendarView?.calendarDataSource = self
        
        calendarView?.scrollToDate(Date(),
                                  triggerScrollToDateDelegate: true,
                                  animateScroll: false,
                                  completionHandler: { [weak self] in
                                    self?.calendarView?.visibleDates { self?.calendarOutput?.didScrollToDateSegment(visibleDates: $0) }
        })
        
    }
}

extension CalendarCollectionViewAdapter: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: String(describing: CalendarCell.self), for: indexPath) as! CalendarCell
        configureCell(cell, cellState: cellState)
        cell.dayLabel.text = cellState.text
        return cell
    }
    
    private func configureCell(_ cell: CalendarCell, cellState: CellState) {
        
        if cellState.dateBelongsTo == .thisMonth {
            cell.dayLabel.textColor = .black
        } else {
            cell.dayLabel.textColor = .gray
        }
        
//        let todayDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
//        let cellStateDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: cellState.date)
//        if todayDateComponents.year == cellStateDateComponents.year &&
//            todayDateComponents.month == cellStateDateComponents.month &&
//            todayDateComponents.day == cellStateDateComponents.day {
//            cell.selectedView.isHidden = false
//            cell.meetingDayMarkView.isHidden = true
//            cell.dayLabel.textColor = .white
//            cell.dayLabel.font = UIFont.boldSystemFont(ofSize: 15)
//            cell.selectedView.isHidden = true
//            cell.meetingDayMarkView.isHidden = true
//            cell.dayLabel.font = UIFont.systemFont(ofSize: 15)
//        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        calendarOutput?.didScrollToDateSegment(visibleDates: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        calendar.deselect(dates: [date])
        calendarOutput?.didCalendarTap(date: date)
    }
    
}

extension CalendarCollectionViewAdapter: JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2100 12 31")!
        let numberOfRows = 6
        return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: numberOfRows, firstDayOfWeek: .monday)
    }
}

extension CalendarCollectionViewAdapter: CalendarCollectionViewAdapterInput {
    
    func scrollToSegment(_ destination: SegmentDestination) {
        calendarView?.scrollToSegment(destination)
    }
}
