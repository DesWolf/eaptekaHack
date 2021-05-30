//
//  CartPresenter.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol CartPresenterType {
    var viewController: CartViewControllerType! { get set }
}

class CartPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: CartViewControllerType!
   
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension CartPresenter: CartPresenterType {}
