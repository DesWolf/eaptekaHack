//
//  StudentsAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

private let storyboardName = "Catalog"

struct CatalogAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(CatalogViewController.self) { r, c in
            guard var presenter = r.resolve(CatalogPresenterType.self) else {
                fatalError("Can't resolve StudentsPresenterType in Catalog View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(CatalogPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Catalog Presenter")
            }
            
            
            return CatalogPresenter(moduleAssembly: moduleAssembly)
        }
    }
}

