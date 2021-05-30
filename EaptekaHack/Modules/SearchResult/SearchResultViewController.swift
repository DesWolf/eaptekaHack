//
//  SearchResultViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol SearchResultViewControllerType: AnyObject {
    var presenter: SearchResultPresenterType! { get set }
    func reloadTable()
}

class SearchResultViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: SearchResultPresenterType!
    
    override func loadView() {
        let view = SearchResultView()
        
        view.backButton.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        self.view = view
        setupView()
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        guard let view = self.view as? SearchResultView else { return }
        
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.searchBar.delegate = self
        view.tableView.register(UINib(nibName: DefaultSearchCell.className, bundle: nil), forCellReuseIdentifier: DefaultSearchCell.reuseIdentifier)
        view.tableView.register(UINib(nibName: TableCellWithCollection.className, bundle: nil), forCellReuseIdentifier: TableCellWithCollection.reuseIdentifier)
    }
    
    @objc func backTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func load() {
        guard let view = self.view as? SearchResultView, let searchText = view.searchBar.text else { return }
        presenter.load(search: searchText)
    }
}

extension SearchResultViewController: SearchResultViewControllerType {
    func reloadTable() {
        DispatchQueue.main.async {
            guard let view = self.view as? SearchResultView else { return }
            view.tableView.reloadData()
        }
    }
}

// MARK: - Search

extension SearchResultViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(load), object: nil)
            self.perform(#selector(load), with: nil, afterDelay: 0.5)
            reloadTable()
        }
    }
}


// MARK: - TableView Delegate, DataSource

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.identifier(at: indexPath), for: indexPath)
        let model = presenter.model(at: indexPath)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(presenter.cellHeight(at: indexPath))
    }
}

