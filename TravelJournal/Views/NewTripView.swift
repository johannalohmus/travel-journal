//
//  NewTripView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/26/24.
//

import SwiftUI

struct NewTripView: View {
    @StateObject var viewModel = NewTripViewViewModel()
    @Binding var newTripPresented: Bool
    
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
