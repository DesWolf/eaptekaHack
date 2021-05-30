//
//  SearchAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

struct SearchAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in SearchPresenter")
            }
            
            guard let service = r.resolve(SearchServiceType.self) else {
                fatalError("Could not resolve Search service")
            }
            
            return SearchPresenter(moduleAssembly: moduleAssembly, service: service)
        }
        
        container.register(SearchViewControllerType.self) { r in
            let viewController = SearchViewController()
            viewController.modalPresentationStyle = .overFullScreen
            guard var presenter = r.resolve(SearchPresenterType.self) else {
                fatalError("Can't resolve SearchPresenterType in Login View Controller")
            }
            
            viewController.presenter = presenter
            presenter.viewController = viewController
            return viewController
        }
    }
}
