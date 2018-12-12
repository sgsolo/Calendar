//
//  DayRouter.swift
//  CalendarApp
//
//  Created by Calendar App on 10/12/2018.
//  Copyright © 2018 High Technologies Center. All rights reserved.
//

import UIKit

class DayRouter: NSObject, DayRouterInput {

	weak var transitionHandler: UIViewController!
    
    func popViewController() {
        transitionHandler.navigationController?.popViewController(animated: true)
    }
    
    func openNewViewController() {
        let storyboard = try! addTrainingAssembly.resolve() as UIStoryboard
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "AddTrainingViewController") as? AddTrainingViewController else { return }
        
        self.transitionHandler.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
