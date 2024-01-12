//
//  InputView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import SwiftUI

struct InputView: View {
    
    // MARK: - Properties
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}

// MARK: - Preview
#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}