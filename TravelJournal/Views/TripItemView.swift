//
//  TripItemView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/30/24.
//

import SwiftUI

struct TripItemView: View {
    @StateObject var viewModel = TripItemViewViewModel()
    let item: TripItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.subheadline)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct TripItemView_Previews: PreviewProvider {
    static var previews: some View {
        TripItemView(item: .init(
            id:"123",
             title: "Get milk",
             dueDate: Date().timeIntervalSince1970,
             createdDate: Date().timeIntervalSince1970,
             isDone: false))
    }
}