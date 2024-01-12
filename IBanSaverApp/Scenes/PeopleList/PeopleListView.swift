//
//  PeopleListView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 11.01.24.
//

import SwiftUI

struct PeopleListView: View {
    
    @ObservedObject var viewModel = PeopleListViewModel()
    
    var body: some View {
        HeaderView()
        sortButton
        ScrollView {
            VStack (alignment: .center, spacing: 26) {
                ForEach(viewModel.people, id: \.id) { person in
                    PersonView(person: person)
                }
            }
            .padding()
            .preferredColorScheme(.dark)
            
        }
        button
    }
    
}

extension PeopleListView {
    
    var button: some View {
        Button(action: {
            print("Add button tapped")
        }) {
            Text("Add New Contacts")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.buttonColor)
                .cornerRadius(25)
        }
        .padding()
    }
    
    var sortButton: some View {
        HStack {
            Spacer()
            Button("Sort") {
                viewModel.sortPeople()
            }
            .padding()
        }
    }
}



#Preview {
    PeopleListView()
}
