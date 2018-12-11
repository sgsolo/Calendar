//
//  BaseCollectionViewAdapter.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 24.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

struct CollectionSectionData {
    var header: Any?
    var footer: Any?
    var objects: [Any]
    
    init(header: Any? = nil, footer: Any? = nil, objects: [Any]) {
        self.header = header
        self.footer = footer
        self.objects = objects
    }
}

protocol BaseCollectionViewAdpaterInput: class {
    var collectionView: UICollectionView? { get set }
    
    func updateData(with models: [CollectionSectionData])
}

protocol BaseCollectionViewAdapterOutput: class {
    func didSelectCollectionCell(at indexPath: IndexPath)
    func didFocusOnCollectionCell(at indexPath: IndexPath)
    func didEndScrollingAnimation()
    func didEndDragging(willDecelerate: Bool)
    func didEndDecelerating()
}

extension BaseCollectionViewAdapterOutput {
    func didSelectCollectionCell(at indexPath: IndexPath) {}
    func didFocusOnCollectionCell(at indexPath: IndexPath) {}
    func didEndScrollingAnimation() {}
    func didEndDragging(willDecelerate: Bool) {}
    func didEndDecelerating() {}
}

/// Base adapter for collection views
///
class BaseCollectionViewAdapter: NSObject, BaseCollectionViewAdpaterInput {
    
    weak var output: BaseCollectionViewAdapterOutput?
    
    var collectionView: UICollectionView? {
        didSet {
            self.prepareCollectionView()
        }
    }
    
    var collectionSections: [CollectionSectionData] = []
    
    /// Classes for used cells
    ///
    /// Should be setted before `collectionView`
    var cellClasses: [RegistrableComponent.Type] = []
    
    /// Classes for supplementary views
    ///
    /// Should be setted before `collectionView`
    var supplementaryViewsClasses: [RegistrableSupplementaryViewComponent.Type] = []
    
    func prepareCollectionView() {
        self.registerCells()
        self.registerSupplementaryViews()
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
    }
    
    func registerCells() {
        self.cellClasses.forEach { (type) in
            switch type.registrableSource {
            case .class:
                self.collectionView?.register(type as? AnyClass, forCellWithReuseIdentifier: type.identifier)
            case let .nib(nib):
                self.collectionView?.register(nib, forCellWithReuseIdentifier: type.identifier)
            }
        }
    }
    
    func registerSupplementaryViews() {
        self.supplementaryViewsClasses.forEach { (type) in
            switch type.registrableSource {
            case .class:
                self.collectionView?.register(type as? AnyClass, forSupplementaryViewOfKind: type.kind, withReuseIdentifier: type.identifier)
            case let .nib(nib):
                self.collectionView?.register(nib, forSupplementaryViewOfKind: type.kind, withReuseIdentifier: type.identifier)
            }
        }
    }
    
    /// Provide cell class for cell model
    ///
    /// override to return appropriate class (`self.cellClasses.first` by default)
    func cellClass(for model: Any) -> RegistrableComponent.Type? {
        return self.cellClasses.first
    }
    
    func supplementaryViewClass(for indexPath: IndexPath, kind: String) -> RegistrableSupplementaryViewComponent.Type? {
        return self.supplementaryViewsClasses.first(where: { $0.kind == kind })
    }
    
    // MARK: BaseCollectionViewAdpaterInput
    
    func updateData(with models: [CollectionSectionData]) {
        self.collectionSections = models
        
        self.collectionView?.reloadData()
    }
    
}

extension BaseCollectionViewAdapter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.collectionSections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionSections[section].objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.collectionSections[indexPath.section].objects[indexPath.row]
        
        guard let cellClass = self.cellClass(for: item) else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellClass.identifier, for: indexPath)
        (cell as? ConfigurableComponent)?.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let viewClass = self.supplementaryViewClass(for: indexPath, kind: kind) else {
            return UICollectionReusableView()
        }
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: viewClass.identifier, for: indexPath)
        
        if kind == UICollectionView.elementKindSectionHeader,
            let object = self.collectionSections[indexPath.section].header {
            (view as? ConfigurableComponent)?.configure(with: object)
        } else if kind == UICollectionView.elementKindSectionFooter,
            let object = self.collectionSections[indexPath.section].footer {
            (view as? ConfigurableComponent)?.configure(with: object)
        }
        
        return view
    }
}

extension BaseCollectionViewAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.output?.didSelectCollectionCell(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let indexPath = context.nextFocusedIndexPath else { return }
        self.output?.didFocusOnCollectionCell(at: indexPath)
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
}

extension BaseCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = self.collectionSections[indexPath.section].objects[indexPath.row]
        
        guard let cellClass = self.cellClass(for: item) as? CollectionViewItemsSizeProvider.Type else { return .zero }
        
        return cellClass.size(for: item, collectionViewSize: collectionView.bounds.size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard let viewClass = self.supplementaryViewClass(for: IndexPath(item: 0, section: section), kind: UICollectionView.elementKindSectionFooter) as? CollectionViewItemsSizeProvider.Type  else {
            return .zero
        }
        
        return viewClass.size(for: self.collectionSections[section].footer, collectionViewSize: collectionView.bounds.size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let viewClass = self.supplementaryViewClass(for: IndexPath(item: 0, section: section), kind: UICollectionView.elementKindSectionHeader) as? CollectionViewItemsSizeProvider.Type else {
            return .zero
        }
        
        return viewClass.size(for: self.collectionSections[section].header, collectionViewSize: collectionView.bounds.size)
    }
}
