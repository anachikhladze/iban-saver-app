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
    init(action: @escaping () -> Void, text: String) {
        self.action = action
        self.text = text
    }
    
    init(action: @escaping () -> Void, label: String, systemImage: String) {
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
        .background(Color(red: 1, green: 96/255, blue: 10/255))
        .cornerRadius(10)
    }
}
