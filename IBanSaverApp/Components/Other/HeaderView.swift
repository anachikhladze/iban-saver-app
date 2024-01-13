//
//  HeaderView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 12.01.24.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    //MARK: - Body
    var body: some View {
        VStack {
            Text("Contacts")
                .font(.title)
                .bold()
            Image(colorScheme == .light ? .profileIcon : .profileIconDark)
                .resizable()
                .frame(width: 140, height: 140)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HeaderView()
}
