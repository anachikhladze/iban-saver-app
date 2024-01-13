//
//  SettingsRowView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK: - Properties
    let imageName: String
    let title: String
    let tintColor: Color
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.primaryWhite)
        }
    }
}

// MARK: - Preview
#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
