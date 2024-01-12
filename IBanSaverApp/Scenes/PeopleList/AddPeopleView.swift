//
//  AddPeopleView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 12.01.24.
//

import SwiftUI

struct AddPeopleView: View {
    var person: Person
    @State var iban = ""
    var body: some View {
        VStack {
            TextField("Type the IBAN", text: $iban)
            Button("Save the IBAN") {
                
            }
            .preferredColorScheme(.dark)
        }
        .padding()
    }
}

//#Preview {
//    AddPeopleView()
//}
