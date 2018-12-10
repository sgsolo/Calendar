//
//  CommonAssembly.swift
//  HTCMeetingRoom
//
//  Created by Виталий Камашев on 03.07.2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import Dip

struct CommonAssembly {
    
    static let uiContainer = DependencyContainer { container in
        DependencyContainer.uiContainers = [container]
    }
    
}
