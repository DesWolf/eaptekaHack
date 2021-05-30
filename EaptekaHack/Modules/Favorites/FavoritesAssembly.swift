//
//  FavoritesAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

private let storyboardName = "Favorites"

struct FavoritesAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(FavoritesViewController.self) { r, c in
            guard var presenter = r.resolve(FavoritesPresenterType.self) else {
                fatalError("Can't resolve ProfilePresenterType in Favorites View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(FavoritesPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Favorites Presenter")
            }
            
            return FavoritesPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
