//
//  SecondTabViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol MainViewControllerType: AnyObject, PresentingView {
    var presenter: MainPresenterType! { get set }
}

class MainViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: MainPresenterType!
    
    // MARK: - Private properties
    
    private let plug = UIImageView()
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plug.image = #imageLiteral(resourceName: "main")
        view.addSubview(plug)
        
        plug.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MainViewController: MainViewControllerType {}
