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
    @Published var showAlert = false
    // description
    // images
    // location
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
