//
//  ContentView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack
        {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hi, world!")
            }
            VStack {
                Text("Yippee")
            }
        }
        
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
