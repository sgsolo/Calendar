//
//  CalendarRouter.swift
//  CalendarApp
//
//  Created by Calendar App on 29/10/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

final class CalendarRouter: BaseRouter, CalendarRouterInput {

}

extension CalendarRouter {
    
    func openEditDateModule(date: Date) {
        let storyboard = try! dayAssembly.resolve() as UIStoryboard
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "DayViewController") as? DayViewController else { return }
        (destinationViewController.moduleInput as? DayModuleInput)?.setDate(date)
        
        self.transitionHandler.navigationController?.pushViewController(destinationViewController, animated: true)
        
    }
}
