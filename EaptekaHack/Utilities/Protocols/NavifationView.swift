//
//  NavifationView.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol NavigatingView {
    @discardableResult
    func push(viewController: UIViewController, animated: Bool) -> Bool
    @discardableResult
    func pushOverAll(viewController: UIViewController, animated: Bool) -> Bool
}

extension NavigatingView where Self: UIViewController {
    @discardableResult
    func push(viewController: UIViewController, animated: Bool = true) -> Bool {
        guard let navi = navigationController else { return false }
        navi.pushViewController(viewController, animated: animated)
        return true
    }
    
    @discardableResult
    func pushOverAll(viewController: UIViewController, animated: Bool) -> Bool {
        guard
            let topController = UIApplication.topViewController(),
            let navi = topController.navigationController
        else { return false }
        navi.pushViewController(viewController, animated: animated)
        return true
    }
}
