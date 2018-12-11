//
//  LoadableViewInput.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 02/10/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

protocol LoadableViewInput: LoadableInput {
    var activityIndicator: UIActivityIndicatorView! { get set }
}

extension LoadableViewInput {
    func setLoading(_ loading: Bool) {
        self.activityIndicator.superview?.bringSubviewToFront(self.activityIndicator)
        loading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
    }
}
