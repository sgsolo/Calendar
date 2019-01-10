//
//  DayViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class DayViewController: BaseViewController, DayViewInput {

    var output: DayViewOutput!
    var adapter: BaseTableViewAdpaterInput!

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle
    
    override func setupView() {
        super.setupView()
        configureNavigationBar()
        
        adapter.tableView = tableView
    }
    
    func configureNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapNavigationItem))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add new", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapNewItem))
    }
    
    func updateData() {
        adapter.updateData(with: output.getExercises())
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    //MARK: Actions
    
    @objc func didTapNavigationItem() {
        output.didTapNavigationItem()
    }
    
    @objc func didTapNewItem() {
        output.didTapNewItem()
    }
    
}

extension DayViewController: BaseTableViewAdapterOutput {
    
    func didSelectTableCell(at indexPath: IndexPath) {
        output.didSelectExercise(index:indexPath.item)
    }
}
