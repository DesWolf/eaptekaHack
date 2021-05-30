//
//  ViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol SearchViewControllerType: AnyObject, PresentingView {
    var presenter: SearchPresenterType! { get set }
    func reloadTable()
}

class SearchViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: SearchPresenterType!
    
    override func loadView() {
        let view = SearchView()

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
        guard let view = self.view as? SearchView else { return }
        
        view.searchBar.delegate = self
        
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.register(UINib(nibName: SearchViewCell.className, bundle: nil), forCellReuseIdentifier: SearchViewCell.reuseIdentifier)
    }
    
    @objc func load() {
        guard let view = self.view as? SearchView, let searchText = view.searchBar.text else { return }
        presenter.load(search: searchText)
    }
}

extension SearchViewController: SearchViewControllerType {
    func reloadTable() {
        DispatchQueue.main.async {
            guard let view = self.view as? SearchView else { return }
            view.tableView.reloadData()
        }
        
    }
}

// MARK: - Search

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(load), object: nil)
            self.perform(#selector(load), with: nil, afterDelay: 0.5)
        }
    }
}


// MARK: - TableView Delegate, DataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewCell.reuseIdentifier, for: indexPath)
        let model = presenter.model(at: indexPath)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectItem(at: indexPath)
    }
}
