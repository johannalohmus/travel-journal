//
//  NewTripViewViewModel.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/26/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewTripViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var tripDate = Date()
    @Published var showAlert = false
    // description
    // images
    // location
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newTrip = TripItem(id: newId,
                               title: title,
                               tripDate: tripDate.timeIntervalSince1970,
                               createdDate: Date().timeIntervalSince1970,
                               isDone: false)
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("trips")
            .document(newId)
            .setData(newTrip.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        return true
    }
}
