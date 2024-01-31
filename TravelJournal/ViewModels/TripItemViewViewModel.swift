//
//  TripItemViewViewModel.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/30/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TripItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TripItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("trips")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
