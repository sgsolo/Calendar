//
//  BaseTabelViewAdapter.swift
//  CalendarApp
//
//  Created by Григорий Соловьев on 12/12/2018.
//  Copyright © 2018 Григорий Соловьев. All rights reserved.
//

import UIKit


protocol BaseTableViewAdpaterInput: class {
    var tableView: UITableView? { get set }
    
    func updateData(with models: [SectionData])
}

protocol BaseTableViewAdapterOutput: class {
    func didSelectTableCell(at indexPath: IndexPath)
    func didEndScrollingAnimation()
    func didEndDragging(willDecelerate: Bool)
    func didEndDecelerating()
}

extension BaseTableViewAdapterOutput {
    func didSelectTableCell(at indexPath: IndexPath) {}
    func didEndScrollingAnimation() {}
    func didEndDragging(willDecelerate: Bool) {}
    func didEndDecelerating() {}
}

/// Base adapter for table views
///
class BaseTableViewAdapter: NSObject, BaseTableViewAdpaterInput {

    weak var output: BaseTableViewAdapterOutput?
    
    var tableView: UITableView? {
        didSet {
            self.prepareTableView()
        }
    }
    
    var tableSections: [SectionData] = []
    
    /// Classes for used cells
    ///
    /// Should be setted before `tableView`
    var cellClasses: [RegistrableComponent.Type] = []
    
    /// Classes for supplementary views
    ///
    /// Should be setted before `tableView`
    var supplementaryViewsClasses: [RegistrableSupplementaryViewComponent.Type] = []
    
    func prepareTableView() {
        self.registerCells()
        self.registerSupplementaryViews()
        
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    func registerCells() {
        self.cellClasses.forEach { (type) in
            switch type.registrableSource {
            case .class:
                self.tableView?.register(type as? AnyClass, forCellReuseIdentifier: type.identifier)
            case let .nib(nib):
                self.tableView?.register(nib, forCellReuseIdentifier: type.identifier)
            }
        }
    }
    
    func registerSupplementaryViews() {
        self.supplementaryViewsClasses.forEach { (type) in
            switch type.registrableSource {
            case .class:
                self.tableView?.register(type as? AnyClass, forCellReuseIdentifier: type.identifier)
            case let .nib(nib):
                self.tableView?.register(nib, forCellReuseIdentifier: type.identifier)
            }
        }
    }
    
    /// Provide cell class for cell model
    ///
    /// override to return appropriate class (`self.cellClasses.first` by default)
    func cellClass(for model: Any) -> RegistrableComponent.Type? {
        return self.cellClasses.first
    }
    
    func supplementaryViewClass(for section: Int, kind: String) -> RegistrableSupplementaryViewComponent.Type? {
        return self.supplementaryViewsClasses.first(where: { $0.kind == kind })
    }
    
    // MARK: BaseCollectionViewAdpaterInput
    
    func updateData(with models: [SectionData]) {
        self.tableSections = models
        
        self.tableView?.reloadData()
    }
    
}

extension BaseTableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableSections[section].objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.tableSections[indexPath.section].objects[indexPath.row]
        
        guard let cellClass = self.cellClass(for: item) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath)
        (cell as? ConfigurableComponent)?.configure(with: item)
        return cell
    }
}

extension BaseTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.output?.didSelectTableCell(at: indexPath)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.output?.didEndScrollingAnimation()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.output?.didEndDragging(willDecelerate: decelerate)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.output?.didEndDecelerating()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let object = self.tableSections[section].header as? String {
            return object
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let viewClass = self.supplementaryViewClass(for: section, kind: "footer") else {
            return UICollectionReusableView()
        }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewClass.identifier)
        
        if let object = self.tableSections[section].footer {
            (view as? ConfigurableComponent)?.configure(with: object)
        }
        
        return view
    }
}
