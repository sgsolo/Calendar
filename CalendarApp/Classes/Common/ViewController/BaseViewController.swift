//
//  BaseViewController.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 19.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

//protocol StoryboardCreatable {
//    func didCreateFromStoryboard()
//}

typealias TransitionBlock = (_ moduleInput: AnyObject?) -> Void

class BaseViewController: UIViewController {
    
    var moduleInput: AnyObject?
    
    lazy public var lifecycleObserver: ViewLifecycleObserver? = {
        let mirror = Mirror(reflecting: self)
        return mirror.find(element: "output") as? ViewLifecycleObserver ?? mirror.find(element: "moduleInput") as? ViewLifecycleObserver
    }()
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        self.lifecycleObserver?.viewAwokeFromNib()
    }
    
    final override public func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.lifecycleObserver?.viewDidLoad()
    }
    
    open func setupView() { }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.lifecycleObserver?.viewWillAppear()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.lifecycleObserver?.viewDidAppear()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.lifecycleObserver?.viewWillDisappear()
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.lifecycleObserver?.viewDidDisappear()
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.lifecycleObserver?.viewWillLayoutSubviews()
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.lifecycleObserver?.viewDidLayoutSubviews()
    }

    // MARK: - Navigation
 
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController: UIViewController!
        if let navigationController = segue.destination as? UINavigationController {
            destinationViewController = navigationController.viewControllers[0]
        } else {
            destinationViewController = segue.destination
        }
        if let transitionBlock = sender as? TransitionBlock, let destination = destinationViewController as? BaseViewController {
            transitionBlock(destination.moduleInput)
        }
        super.prepare(for: segue, sender: sender)
    }

}
