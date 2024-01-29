//
//  MainView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            MapView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            TripView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Trips", systemImage: "airplane")
                }
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
