//
//  SearchResultPresenter.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol SearchResultPresenterType {
    var viewController: SearchResultViewController! { get set }
    func viewDidLoad()
    func model(at index: IndexPath) -> SelfConfigurableViewModel
    func numberOfRows() -> Int
    func identifier(at index: IndexPath) -> String
    func cellHeight(at index: IndexPath) -> Int
}

class SearchResultPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: SearchResultViewController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension SearchResultPresenter: SearchResultPresenterType {
    func cellHeight(at index: IndexPath) -> Int {
        switch index.row {
        case 0:
            return 404
        default:
            return 198
        }
    }
    
    func identifier(at index: IndexPath) -> String {
        switch index.row {
        case 0:
            return TableCellWithCollection.reuseIdentifier
        default:
            return DefaultSearchCell.reuseIdentifier
        }
    }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel {
        switch index.row {
        case 0:
            return TableCellWithCollectionViewModel(dataSource: self, delegate: self)
        default:
            return DefaultSearchCellViewModel(name: SampleData.sampleTwo[index.row - 1].name,
                                              substance: SampleData.sampleTwo[index.row - 1].substance ?? "",
                                              reciptNeeded: SampleData.sampleTwo[index.row - 1].reciept ?? true,
                                              price: SampleData.sampleTwo[index.row - 1].price ?? 0)
        }
    }
    
    func numberOfRows() -> Int {
        SampleData.sampleTwo.count
    }
    
    func viewDidLoad() {

    }
}

extension SearchResultPresenter: TableCellWithCollectionDelegate, TableCellWithCollectionDataSource {
    func numberOfItems(at cellIndex: IndexPath) -> Int {
        SampleData.sampleOne.count
    }
    
    func item(at cellIndex: IndexPath, at index: Int) -> SelfConfigurableViewModel {
        return CollectionCellViewModel(name: SampleData.sampleOne[index].name,
                                       reciptNeeded: SampleData.sampleOne[index].reciept ?? true,
                                       price: SampleData.sampleOne[index].price ?? 0)
    }
    
    func selectItem(at cellIndex: IndexPath, at index: Int) {
        
    }
    
    
}
