//
//  TripView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/25/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TripView: View {
    @StateObject var viewModel: TripViewViewModel
    @FirestoreQuery var trips: [TripItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._trips = FirestoreQuery(
            collectionPath: "users/\(userId)/trips")
        self._viewModel = StateObject(wrappedValue:
                                        TripViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack
            {
                List(trips) { item in
                    TripItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete Item")
                                    .tint(Color.red)
                            }
                        }
                }
                
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
