//
//  TabBarAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

private let storyboardName = "TabBar"

class TabBarAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabBarViewControllerType.self) { r in
            let storyboard = SwinjectStoryboard.create(name: storyboardName, bundle: nil, container: r)
            let controller = storyboard.instantiateInitialViewController()
            
            guard let view = controller as? TabBarViewControllerType else {
                fatalError("Tab Bar Controller does not conform to Tab Bar protocol")
            }
            guard let presenter = r.resolve(TabBarPresenterType.self) else {
                fatalError("Can't resolve TabBarViewModel in Tab Bar Controller")
            }
            
            view.presenter = presenter
            return view
        }
        
        container.storyboardInitCompleted(TabBarViewController.self) { (r, c) in }
        
        container.register(TabBarPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Main View Controller")
            }
            
            return TabBarPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
