//
//  MedsResponce.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/30/21.
//

import Foundation

struct MedsResponce: Codable {
    let substance: String
    let recomended: [Meds]
    let search: [Meds]

    private enum CodingKeys: String, CodingKey {
        case substance = "active_substance"
        case recomended = "drug_recommended"
        case search = "drug_search"
    }
}

