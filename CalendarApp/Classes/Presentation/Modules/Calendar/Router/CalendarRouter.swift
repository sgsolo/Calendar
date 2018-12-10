//
//  CalendarRouter.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class CalendarRouter: NSObject, CalendarRouterInput {

	weak var transitionHandler: UIViewController!
}

extension CalendarRouter {
    
    func openEditDateModule() {
        let storyboard = try! dayAssembly.resolve() as UIStoryboard
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "DayViewController") as? DayViewController else { return }
        
        self.transitionHandler.navigationController?.pushViewController(destinationViewController, animated: true)
        
    }
}
