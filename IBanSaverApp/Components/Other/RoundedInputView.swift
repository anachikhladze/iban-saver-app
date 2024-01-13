//
//  RoundedInputView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 13.01.24.
//

import SwiftUI

struct RoundedInputView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text, prompt: Text("IBan Number").foregroundColor(.white.opacity(0.5)))
            .submitLabel(.done)
            .textFieldStyle(.plain)
            .frame(height: 16)
            .padding()
            .background(Color.midnightGray.cornerRadius(8))
            .foregroundStyle(.white)
    }
}

#Preview {
    RoundedInputView(text: .constant("Enter Username"))
}
