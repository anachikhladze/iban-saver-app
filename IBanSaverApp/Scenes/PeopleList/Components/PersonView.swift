//
//  PersonView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 12.01.24.
//

import SwiftUI

struct PersonView: View {
    var person: Person
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 40)
            Spacer()
            nameStack
        }
        .frame(width: 240, height: 36)
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.gray)
        .cornerRadius(10.0)
    }
}

extension PersonView {
    var nameStack: some View {
        VStack {
            Text(person.firstName)
                .bold()
                .font(.system(size: 18))
                .lineLimit(2)
            Text(person.lastName)
                .bold()
                .font(.system(size: 18))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    PersonView(person: Person(firstName: "Nick", lastName: "Doe", ibanDetails: []))
}
