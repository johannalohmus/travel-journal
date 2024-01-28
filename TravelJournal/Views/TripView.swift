//
//  TripView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/25/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TripView: View {
    @StateObject var viewModel = TripViewViewModel()
    @FirestoreQuery var trips: [TripItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._trips = FirestoreQuery(
            collectionPath: "users/\(userId)/trips")
    }
    
    var body: some View {
        NavigationView {
            VStack
            {
                
            }
            .navigationTitle("Trips")
            .toolbar {
                Button {
                    viewModel.showingNewTripView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewTripView) {
                NewTripView(newTripPresented: $viewModel.showingNewTripView)
            }
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(userId: "")
    }
}
