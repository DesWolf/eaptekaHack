//
//  Meds.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

struct Meds: Codable {
    let id: Int
    let name: String
    let reciept: Bool?
    let price: Int?
    let substance: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, reciept, substance
        case name = "prep_short"
        case price = "prep_id"
        
    }
}


class SampleData {
    static var sampleOne = [Meds(id: 0, name: "Арбидол", reciept: true, price: 203, substance: "Парацетомол"),
                            Meds(id: 1, name: "Афлубин", reciept: false, price: 154, substance: "Парацетомол"),
                            Meds(id: 2, name: "Смекта", reciept: true, price: 560, substance: "Парацетомол"),
                            Meds(id: 3, name: "Имодиум", reciept: false, price: 860, substance: "Парацетомол")
    ]
    
    static var sampleTwo = [Meds(id: 4, name: "Иполикс", reciept: true, price: 506, substance: "Парацетомол"),
                            Meds(id: 5, name: "Нозовин", reciept: false, price: 233, substance: "Парацетомол"),
                            Meds(id: 6, name: "Мреко", reciept: true, price: 302, substance: "Парацетомол"),
                            Meds(id: 7, name: "Вивра", reciept: false, price: 1045, substance: "Парацетомол")
    ]
    
}
