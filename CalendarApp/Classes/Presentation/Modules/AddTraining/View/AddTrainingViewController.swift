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
        
        adapter.tableView = tableView
        adapter.updateData(with: output.getExercises())
    }
    
    func configureNavigationBar() {
        title = "Exercise choice"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddTrainingButton))
    }
    
    //MARK: Actions
    
    @objc func didTapAddTrainingButton() {
        output.didTapAddTrainingButton()
    }
    
    //MARK: AddTrainingViewInput
    
    func updateData() {
        adapter.updateData(with: output.getExercises())
    }
    
}

extension AddTrainingViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        adapter.updateData(with: output.filterExercises(by: searchController.searchBar.text))
    }
}

extension AddTrainingViewController: BaseTableViewAdapterOutput {
    
    func didSelectTableCell(at indexPath: IndexPath) {
        output.didSelectTableViewCell(row: indexPath.row)
    }
}
