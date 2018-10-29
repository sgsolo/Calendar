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
    
//    static let container = DependencyContainer { container in
//        unowned let container = container
//
//        container.register(.weakSingleton) { RoomsApiServiceImplementation() as RoomsApiService }
//            .resolvingProperties { container, item in
//                let service = item as! RoomsApiServiceImplementation
//                service.authService = try! container.resolve()
//        }
//        container.register(.weakSingleton) { OrdersApiServiceImplementation() as OrdersApiService }
//            .resolvingProperties { container, item in
//                let service = item as! OrdersApiServiceImplementation
//                service.authService = try! container.resolve()
//        }
//        container.register(.weakSingleton) { AuthServiceImplementation() as AuthService }
//        container.register(.weakSingleton) { NotificationsServiceImplementation() as NotificationsService }
//    }
}
