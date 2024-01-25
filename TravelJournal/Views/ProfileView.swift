//
//  ProfileView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        VStack
        {
            Text("Hi")
            TLButton(title: "Log Out", background: .red
            ) {
                //action
            }
            .frame(width:200, height:50)
        }
        
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
