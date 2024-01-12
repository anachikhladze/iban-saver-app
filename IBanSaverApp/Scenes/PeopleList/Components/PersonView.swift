//
//  PersonView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 12.01.24.
//

import SwiftUI

struct PersonView: View {
    //MARK: - Person
    var person: Person
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 40)
            Spacer()
            nameStack
        }
        .frame(height: 36)
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.gray)
        .cornerRadius(10.0)
    }
}

//MARK: - Extension
private extension PersonView {
    //MARK: - Computed Properties
    var nameStack: some View {
        VStack {
            Text(person.firstName + " " + person.lastName)
        }
        .bold()
        .font(.system(size: 18))
        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PersonView(person: Person(firstName: "Nick", lastName: "Doe", ibanDetails: []))
}
