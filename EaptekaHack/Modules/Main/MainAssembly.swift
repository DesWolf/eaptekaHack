//
//  SecondTabAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

private let storyboardName = "Main"

struct MainAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(MainViewController.self) { r, c in
            guard var presenter = r.resolve(MainPresenterType.self) else {
                fatalError("Can't resolve CalendarPresenterType in Main View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(MainPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Main Presenter")
            }
            
            return MainPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
