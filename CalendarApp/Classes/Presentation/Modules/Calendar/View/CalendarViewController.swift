//
//  CalendarViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import JTAppleCalendar

class CalendarViewController: UIViewController, CalendarViewInput {

    var output: CalendarViewOutput!
    var moduleInput: CalendarModuleInput!
    var calendarView: JTAppleCalendarView
    
    @IBOutlet weak var daysOfWeekContainerView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    
    // MARK: Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        calendarView = JTAppleCalendarView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        calendarView = JTAppleCalendarView()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCalendar()
    }
    
    func configureCalendar() {
        self.view.addSubview(calendarView)
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        calendarView.scrollDirection = .horizontal
        calendarView.isPagingEnabled = true
        calendarView.backgroundColor = .white
        calendarView.register(UINib(nibName: String(describing: CalendarCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: CalendarCell.self))
        
        calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: false, animateScroll: false, completionHandler: { [weak self] in
            self?.calendarView.visibleDates { self?.setupViewsOfCalendar(from: $0) }
        })
    }
    
    private func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else { return }
        
        let month = Calendar.current.dateComponents([.month], from: startDate).month!
        let formatter = DateFormatter()
        let monthName = formatter.monthSymbols[(month - 1) % 12]
        let year = Calendar.current.component(.year, from: startDate)
        self.monthLabel.text = monthName + " " + String(year)
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
        calendarView.scrollToSegment(.previous)
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        calendarView.scrollToSegment(.next)
    }
    
}

extension CalendarViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: String(describing: CalendarCell.self), for: indexPath) as! CalendarCell
        cell.dayLabel.text = cellState.text
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        calendar.deselect(dates: [date])
        output.didCalendarTap(date: date)
    }
    
}

extension CalendarViewController: JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2100 12 31")!
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate, firstDayOfWeek: .monday)
        return parameters
    }
}

