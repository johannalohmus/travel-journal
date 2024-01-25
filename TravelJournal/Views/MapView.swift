//
//  MapView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/25/24.
//

import SwiftUI

struct MapView: View {
    @StateObject var viewModel = MapViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack
            {
                
            }
            .navigationTitle("Map")
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

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(userId: "")
    }
}
