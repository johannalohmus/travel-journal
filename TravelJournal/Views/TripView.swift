//
//  TripView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/25/24.
//

import SwiftUI

struct TripView: View {
    @StateObject var viewModel = TripViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack
            {
                
            }
            .navigationTitle("Trips")
            .toolbar {
                Button {
                    // add trip
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(userId: "")
    }
}
