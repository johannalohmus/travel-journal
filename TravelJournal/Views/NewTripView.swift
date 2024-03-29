//
//  NewTripView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/26/24.
//

import MapboxSearch
import MapboxSearchUI
import SwiftUI

struct NewTripView: View {
    @StateObject var viewModel = NewTripViewViewModel()
    @Binding var newTripPresented: Bool
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Text("New Trip")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                
                // Due Date (Temp)
                DatePicker("Trip Start Date", selection: $viewModel.tripDate).datePickerStyle(GraphicalDatePickerStyle())
                
                // Description
                
                // Location
                let placeAutocomplete = PlaceAutocomplete(accessToken: mapboxAccessToken)
                let query = "Starbucks"
                placeAutocomplete.suggestions(for: query) { result in ... }
                
                placeAutocomplete.suggestions(for: query) { result in
                    switch result {
                    case .success(let suggestions):
                        self.processSuggestions(suggestions)
                            
                    case .failure(let error):
                        debugPrint(error)
                    }
                }
                
                let selectedSuggestion = pickSuggestion(suggestions)
                placeAutocomplete.select(suggestion: selectedSuggestion) { result in
                    switch result {
                    case .success(let suggestionResult):
                        // process result
                        self.processSelection(suggestionResult)

                    case .failure(let error):
                        // process failure
                        debugPrint(error)
                    }
                }

                NavigationStack {
                }
                .searchable(text:$searchText)
                
                //Images
                
                // Button
                TLButton(title: "Save", background: .pink)
                {
                    if viewModel.canSave {
                        viewModel.save();
                        newTripPresented = false
                    }
                    else
                    {
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

struct NewTripView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripView(newTripPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
