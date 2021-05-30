//
//  SearchPresenter.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol SearchPresenterType {
    var viewController: SearchViewController! { get set }
    func model(at index: IndexPath) -> SelfConfigurableViewModel
    func numberOfRows() -> Int
    func viewDidLoad()
    func load(search: String)
    func selectItem(at cellIndex: IndexPath)
}

class SearchPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: SearchViewController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    private var service: SearchServiceType
    
    private var catalog: [Meds] = []
    private var responce: MedsResponce = MedsResponce(substance: "", recomended: [], search: [])
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType, service: SearchServiceType) {
        self.moduleAssembly = moduleAssembly
        self.service = service
    }
}

extension SearchPresenter: SearchPresenterType {
    func viewDidLoad() {
        
    }
    
    func load(search: String) {
        service.search = search
        
        service.load { [weak self] result in
            guard let self = self, let result = result else { return }
            
            print(result.substance)

                self.catalog = result.search
            SampleData.sampleOne = result.recomended
            SampleData.sampleTwo = result.search
                self.viewController.reloadTable()

        }
    }
    
    func numberOfRows() -> Int {
        return catalog.count
    }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel {
        return SearchCellViewModel(title: catalog[index.row].name)
    }
    
    
    func selectItem(at cellIndex: IndexPath) {
        
        
        if let newView = try? moduleAssembly.assembledView(for: .searchResults) {
            
            viewController.present(viewController: newView, animated: true, completion: nil)

    }
    }
}
