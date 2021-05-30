//
//  FavoritesPresenter.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol FavoritesPresenterType {
    var viewController: FavoritesViewControllerType! { get set }
}

class FavoritesPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: FavoritesViewControllerType!
   
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension FavoritesPresenter: FavoritesPresenterType {}
