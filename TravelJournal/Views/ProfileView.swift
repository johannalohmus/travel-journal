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
            if let user = viewModel.user {
                // avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 125)
                
                // info
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                        Text(user.name)
                    }
                    HStack {
                        Text("Email: ")
                        Text(user.email)
                    }
                    HStack {
                        Text("Member Since: ")
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                }
                .padding()
                
                
                TLButton(title: "Log Out", background: .red
                ) {
                    viewModel.logOut()
                }
                .frame(width:200, height:50)
                .padding()
            } else {
                Text("Loading Profile")
            }
            
        }
        .navigationTitle("Profile")
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
