//
//  CartAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

private let storyboardName = "Cart"

struct CartAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(CartViewController.self) { r, c in
            guard var presenter = r.resolve(CartPresenterType.self) else {
                fatalError("Can't resolve ProfilePresenterType in Cart View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(CartPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Profile Presenter")
            }
            
            return CartPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
