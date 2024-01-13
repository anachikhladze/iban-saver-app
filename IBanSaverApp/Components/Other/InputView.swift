//
//  InputView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 13.01.24.
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
                .foregroundStyle(Color("inputTitleColor"))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(Color("placeholderColor")))
                    .font(.system(size: 14))
            } else {
                TextField("", text: $text, prompt: Text(placeholder).foregroundColor(Color("placeholderColor"))
                )
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
