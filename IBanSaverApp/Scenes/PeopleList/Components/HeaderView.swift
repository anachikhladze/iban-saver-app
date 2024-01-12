//
//  HeaderView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 12.01.24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("MyIBAN")
                .font(.title)
                .bold()
            Image(.profileIcon)
                .resizable()
                .frame(width: 120, height: 120)
                .background(Circle()
                    .foregroundStyle(Color.orange)
                )
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HeaderView()
}
