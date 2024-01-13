//
//  ActionButton.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 11.01.24.
//

import SwiftUI

struct ActionButton: View {
    // MARK: - Properties
    let action: () -> Void
    var text: String?
    var label: String?
    var systemImage: String?
    
    // MARK: - Initializers
    init(text: String, action: @escaping () -> Void ) {
        self.action = action
        self.text = text
    }
    
    init(label: String, systemImage: String, action: @escaping () -> Void) {
        self.action = action
        self.label = label
        self.systemImage = systemImage
    }
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            if let text = text {
                Text(text)
            } else if let label = label, let systemImage = systemImage {
                Label(label, systemImage: systemImage)
            }
        }
        .foregroundColor(.white)
        .fontWeight(.bold)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("ButtonColor"))
        .cornerRadius(10)
    }
}
