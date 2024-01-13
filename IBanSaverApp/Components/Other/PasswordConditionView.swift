//
//  PasswordConditionView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 13.01.24.
//

import SwiftUI

struct PasswordConditionView: View {
    
    // MARK: - Properties
    let condition: Bool
    let text: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: condition ? "checkmark.circle.fill" : "x.circle")
                .foregroundStyle(Color(.systemBlue))
            Text(text)
        }
    }
}

// MARK: - Preview
#Preview {
    PasswordConditionView(condition: false, text: "Test")
}
