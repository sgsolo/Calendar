//
//  ViewLifecycleObserver.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 20.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

public protocol ViewLifecycleObserver: class {
    
    func viewAwokeFromNib()
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func viewDidAppear()
    
    func viewWillDisappear()
    
    func viewDidDisappear()
    
    func viewWillLayoutSubviews()
    
    func viewDidLayoutSubviews()
    
    func didReceiveMemoryWarning()
}

extension ViewLifecycleObserver {
    
    public func viewAwokeFromNib() {}
    
    public func viewDidLoad() {}
    
    public func viewWillAppear() {}
    
    public func viewDidAppear() {}
    
    public func viewWillDisappear() {}
    
    public func viewDidDisappear() {}
    
    public func viewWillLayoutSubviews() {}
    
    public func viewDidLayoutSubviews() {}
    
    public func didReceiveMemoryWarning() {}
}
