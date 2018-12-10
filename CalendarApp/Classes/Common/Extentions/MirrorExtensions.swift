//
//  MirrorExtensions.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 20.09.2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

public extension Mirror {
    public func find(element: String) -> Any? {
        for (label, value) in self.children where label == element {
            return value
        }
        
        if let superMirror = self.superclassMirror {
            return superMirror.find(element: element)
        }
        
        return nil
    }
}
