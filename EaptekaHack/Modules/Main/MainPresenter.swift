//
//  MainViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol MainPresenterType {
    var viewController: MainViewControllerType! { get set }
}

class MainPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: MainViewControllerType!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension MainPresenter: MainPresenterType {}
