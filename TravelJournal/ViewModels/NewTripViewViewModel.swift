//
//  NewTripViewViewModel.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/26/24.
//

import Foundation

class NewTripViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    // description
    // images
    // location
    
    init() {}
    
    func save() {
        
    }
}
