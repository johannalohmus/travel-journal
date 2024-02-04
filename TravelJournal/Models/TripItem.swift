//
//  TripItem.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/27/24.
//

import Foundation

struct TripItem: Codable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let tripDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
