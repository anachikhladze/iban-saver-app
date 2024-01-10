//
//  IBanNumberView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 11.01.24.
//

import SwiftUI

struct IBanNumberView: View {
    // MARK: - Properties
    @StateObject private var viewModel = IBanNumberViewModel()
    
    // MARK: - Body
    var body: some View {
        HStack {
            IBanDetails
            Spacer()
            actionButtons
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.midnightGray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Computed Properties
    var IBanDetails: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(viewModel.bankName)
                .foregroundStyle(Color.white)
                .font(.subheadline)
                .padding(.bottom, 2)
            
            Text("IBan Number")
                .foregroundStyle(Color(red: 1, green: 1, blue: 1, opacity: 0.65))
                .font(.footnote)
            
            Text("GE22BG0000112311") // Replace with dynamic IBAN
                .foregroundStyle(.white).bold()
                .font(.subheadline)
        }
    }
    
    var actionButtons: some View {
        HStack {
            roundedIconButton(icon: "doc.on.doc", action: viewModel.copyIban)
            roundedIconButton(icon: "square.and.arrow.up", action: viewModel.shareIban)
            roundedIconButton(icon: "trash", action: viewModel.deleteIban)
        }
    }
    
}

#Preview {
    IBanNumberView()
}


