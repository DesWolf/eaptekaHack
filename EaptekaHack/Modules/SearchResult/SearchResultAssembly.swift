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
            
            return SearchResultPresenter(moduleAssembly: moduleAssembly)
        }
        
        container.register(SearchResultViewControllerType.self) { r in
            let viewController = SearchResultViewController()
            viewController.modalPresentationStyle = .overFullScreen
            guard let presenter = r.resolve(SearchResultPresenterType.self) else {
                fatalError("Can't resolve SearchResultPresenterType in SearchResult View Controller")
            }
            
            viewController.presenter = presenter
            return viewController
        }
    }
}
