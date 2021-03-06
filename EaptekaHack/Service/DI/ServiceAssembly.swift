//
//  ServiceAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation
import Swinject

struct ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ModuleAssemblyType.self) { r in ModuleAssembly(resolver: r) }.inObjectScope(.container)
        container.register(SearchServiceType.self) { _ in SearchService() }
    }
}
