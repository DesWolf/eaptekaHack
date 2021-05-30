//
//  Swinject+ModuleAssembly.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Swinject

extension Assembly {
    func moduleAssembly(_ r: Resolver) -> ModuleAssemblyType {
        guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
            fatalError("Failed to resolve module assembly")
        }
        return moduleAssembly
    }
}
