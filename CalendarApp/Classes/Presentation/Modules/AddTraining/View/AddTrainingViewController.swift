//
//  AddTrainingViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 12/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class AddTrainingViewController: BaseViewController, AddTrainingViewInput {

    var output: AddTrainingViewOutput!
    var adapter: BaseTableViewAdpaterInput!

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle

    override func setupView() {
        super.setupView()
        configureNavigationBar()
        configureTabelView()
        
        adapter.tableView = tableView
    }
    
    func configureNavigationBar() {
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(didTapNavigationItem))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add new", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapNewItem))//UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapNavigationItem))
    }
    
    func configureTabelView() {
        
    }
}
