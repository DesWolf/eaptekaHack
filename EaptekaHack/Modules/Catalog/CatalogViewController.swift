//
//  CatalogViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol CatalogViewControllerType: AnyObject, PresentingView {
    var presenter: CatalogPresenterType! { get set }
}

class CatalogViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: CatalogPresenterType!
    
    // MARK: - Private properties
    
    
    // MARK: - Public methods
    
    override func loadView() {
        let view = CatalogView()

        view.overButton.addTarget(self, action: #selector(searchTap), for: .touchUpInside)
        self.view = view

        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        guard let view = self.view as? CatalogView else { return }
        
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.register(CatalogCell.self, forCellReuseIdentifier: CatalogCell.reuseIdentifier)
    }
    
    @objc func searchTap() {
        presenter.searchTap()
    }
}

extension CatalogViewController: CatalogViewControllerType {}

// MARK: - TableView Delegate, DataSource

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatalogCell.reuseIdentifier, for: indexPath)
        let model = presenter.model(at: indexPath)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
