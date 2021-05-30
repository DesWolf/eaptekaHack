//
//  PoppingView.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol PoppingView {
    @discardableResult
    func popViewController(animated: Bool) -> Bool
}

extension PoppingView where Self: UIViewController {
    
    @discardableResult
    func popViewController(animated: Bool) -> Bool {
        guard let navi = navigationController else { return false }
        navi.popViewController(animated: animated)
        return true
    }
}
