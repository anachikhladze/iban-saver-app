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
            nameStack
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .foregroundStyle(.white)
                .scaledToFit()
                .frame(width: 30)
        }
        .frame(height: 36)
        .padding()
        .background(Color(.rowBackground))
        .cornerRadius(10.0)
    }
}

//MARK: - Extension
private extension PersonView {
    //MARK: - Computed Properties
    var nameStack: some View {
        VStack {
            Text(person.firstName + " " + person.lastName)
                .foregroundStyle(.white)
        }
        .bold()
        .font(.system(size: 22))
    }
}

#Preview {
    PersonView(person: Person(firstName: "Jonathan", lastName: "Livierda", ibanDetails: []))
}
