//
//  SignInCustomButton.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 12.01.24.
//

import SwiftUI

struct SignInCustomButton: View {
    var label: String
    var action: () async throws -> Void

    var body: some View {
        Button {
            Task {
                try await action()
            }
        } label: {
            HStack {
                Text(label)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundStyle(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top, 24)
    }
}
