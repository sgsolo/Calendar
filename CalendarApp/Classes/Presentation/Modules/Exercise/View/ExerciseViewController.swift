//
//  ExerciseViewController.swift
//  CalendarApp
//
//  Created by Calendar App on 10/01/2019.
//  Copyright © 2019 High Technologies Center. All rights reserved.
//

import UIKit

class ExerciseViewController: BaseViewController, ExerciseViewInput {

    var output: ExerciseViewOutput!
    var adapter: BaseTableViewAdpaterInput!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle
    
    override func setupView() {
        super.setupView()
        adapter.tableView = tableView
        reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
    }
    
    func reloadData() {
        adapter.updateData(with: [SectionData(objects: output.getApproaches())])
    }
    
    // MARK: Actions
    
    @IBAction func didTapAddButton(_ sender: Any) {
        output.didTapAddButton()
    }
}
