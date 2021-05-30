//
//  ModuleAssemply.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

protocol ModuleAssemblyType {
    func assembledView(for: Module) throws -> UIViewController
}

class ModuleAssembly {
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    private func resolveView<T>(for type: T.Type) throws -> UIViewController {
        guard let controller = resolver.resolve(type) as? UIViewController else {
            throw ModuleAssemblyError.dependencyResolvingError
        }
        return controller
    }
}

extension ModuleAssembly: ModuleAssemblyType {
    
    func assembledView(for module: Module) throws -> UIViewController {
        switch module {
        case .tabBar:
            return try resolveView(for: TabBarViewControllerType.self)
        case .catalog:
            return try resolveView(for: CatalogViewControllerType.self)
        case .main:
            return try resolveView(for: MainViewControllerType.self)
        case .profile:
            return try resolveView(for: ProfileViewControllerType.self)
        case .cart:
            return try resolveView(for: CartViewControllerType.self)
        case .favorites:
            return try resolveView(for: FavoritesViewControllerType.self)
        case .search:
            return try resolveView(for: SearchViewControllerType.self)
        case .searchResults:
            return try resolveView(for: SearchResultViewControllerType.self)
        }
    }
}
