//
//  User.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
