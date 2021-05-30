//
//  SearchResultViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol SearchResultViewControllerType: AnyObject {
    var presenter: SearchResultPresenterType! { get set }
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
        view.tableView.register(UINib(nibName: DefaultSearchCell.className, bundle: nil), forCellReuseIdentifier: DefaultSearchCell.reuseIdentifier)
        view.tableView.register(UINib(nibName: TableCellWithCollection.className, bundle: nil), forCellReuseIdentifier: TableCellWithCollection.reuseIdentifier)
    }
    
    @objc func backTap() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchResultViewController: SearchResultViewControllerType { }

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

