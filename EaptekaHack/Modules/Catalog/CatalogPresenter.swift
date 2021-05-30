//
//  CatalogPresenter.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol CatalogPresenterType {
    var viewController: CatalogViewControllerType! { get set }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel
    func numberOfRows() -> Int
    func searchTap()
    func viewDidLoad() 
}

class CatalogPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: CatalogViewControllerType!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType!
    
    private let catalog = [Strings.Catalog.medicine,
                           Strings.Catalog.sets,
                           Strings.Catalog.fastShiping,
                           Strings.Catalog.vitamins,
                           Strings.Catalog.specials,
                           Strings.Catalog.hygiene,
                           Strings.Catalog.beauty,
                           Strings.Catalog.motherAndChild]
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension CatalogPresenter: CatalogPresenterType {

    func viewDidLoad() {
        
//        service.load { result in
//            print(result)
//        }
    }
    
    func numberOfRows() -> Int {
        return catalog.count
    }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel {
        return CatalogCellViewModel(title: catalog[index.row])
    }
    
    func searchTap() {
            if let newView = try? moduleAssembly.assembledView(for: .search) {
                
                viewController.present(viewController: newView, animated: true, completion: nil)
        }
    }
}
