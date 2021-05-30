//
//  AppDelegate+RootController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

extension AppDelegate {
    
    func setRootController() {
        let container = ApplicationAssembly.assembler.resolver
        guard let moduleAssembly = container.resolve(ModuleAssemblyType.self) else {
            return
        }
        let rootController: UIViewController? = try? moduleAssembly.assembledView(for: .tabBar)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootController
    }
}


