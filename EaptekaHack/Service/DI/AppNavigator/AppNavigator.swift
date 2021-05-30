//
//  AppNavigator.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol AppNavigatorType {
    func navigate(to route: AppNavigationRoute, transitionCompletionHandler: ((Bool) -> Void)?)
}

enum AppNavigationRoute {
    case mainPage
}

struct AppNavigator {
    private let moduleAssembly: ModuleAssemblyType
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension AppNavigator: AppNavigatorType {
    func navigate(to route: AppNavigationRoute, transitionCompletionHandler: ((Bool) -> Void)?) {
        let controller: UIViewController
        switch route {
        case .mainPage: 
            if UIApplication.rootViewController() is TabBarViewController { return }
            guard let tabBar = try? moduleAssembly.assembledView(for: .tabBar) else {
                fatalError("Failed to instantiate tab bar at launch")
            }
            controller = tabBar
        
        }
        
        transition(to: controller, completion: transitionCompletionHandler)
}
}

extension AppNavigator: WindowTransitioner { }
