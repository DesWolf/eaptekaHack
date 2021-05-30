//
//  WindowTransitioner.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol WindowTransitioner {
    func transition(to: UIViewController, completion: ((Bool) -> Void)?)
}

extension WindowTransitioner {
    func transition(to controller: UIViewController, completion: ((Bool) -> Void)?) {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            fatalError("Failed to get window")
        }
        window.rootViewController = controller
        UIView.transition(with: window, duration: .defaultAnimDuration, options: .transitionCrossDissolve, animations: {}, completion: completion)
    }
}
