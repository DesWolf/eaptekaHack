//
//  ApplicationAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {

    // default dependencies
    static let assembler = Assembler(
        [
            TabBarAssembly(),
            MainAssembly(),
            CatalogAssembly(),
            CartAssembly(),
            FavoritesAssembly(),
            ProfileAssembly(),
            ServiceAssembly(),
            ManagerAssembly(),
            SearchAssembly(),
            SearchResultAssembly()
        ]
    )
}
