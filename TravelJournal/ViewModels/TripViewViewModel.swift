//
//  TripViewViewModel.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/25/24.
//

import FirebaseFirestore
import Foundation

class TripViewViewModel: ObservableObject {
    @Published var showingNewTripView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String)
    {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("trips")
            .document(id)
            .delete()
    }
}
