//
//  SearchResultAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

struct SearchResultAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchResultPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in SearchResultPresenter Presenter")
            }
            
            guard let service = r.resolve(SearchServiceType.self) else {
                fatalError("Could not resolve Search service")
            }
            
            return SearchResultPresenter(moduleAssembly: moduleAssembly, service: service)
        }
        
        container.register(SearchResultViewControllerType.self) { r in
            let viewController = SearchResultViewController()
            viewController.modalPresentationStyle = .overFullScreen
            guard var presenter = r.resolve(SearchResultPresenterType.self) else {
                fatalError("Can't resolve SearchResultPresenterType in SearchResult View Controller")
            }
            
            viewController.presenter = presenter
            presenter.viewController = viewController
            return viewController
        }
    }
}
