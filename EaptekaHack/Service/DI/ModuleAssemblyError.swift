//
//  ModuleAssemblyError.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//
import Foundation

enum ModuleAssemblyError: Error {
    case viewControllerInstantiationError
    case dependencyResolvingError
}
