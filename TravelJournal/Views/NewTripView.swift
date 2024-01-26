//
//  NewTripView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/26/24.
//

import SwiftUI

struct NewTripView: View {
    @StateObject var viewModel = NewTripViewViewModel()
    
    var body: some View {
        VStack {
            Text("New Trip")
                .font(.system(size:32))
                .bold()
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date (Temp)
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                
                // Description
                
                // Location
                
                //Images
                
                // Button
                TLButton(title: "Save", background: .pink)
                {
                    viewModel.save();
                }
                .padding()
            }
        }
    }
}

struct NewTripView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripView()
    }
}
