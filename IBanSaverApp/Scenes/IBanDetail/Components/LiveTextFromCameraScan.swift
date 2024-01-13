//
//  LiveTextFromCameraScan.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 12.01.24.
//

import SwiftUI

struct LiveTextFromCameraScan: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @Binding var liveScan: Bool
    @Binding var scannedText: String
    
    // MARK: - Properties
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            content
        }
    }
    // MARK: - Computed Properties
    var content: some View {
        VStack {
            header
            Spacer()
            dataScanner
            Spacer()
            dismissButton
        }
        .padding()
    }
    
    var header: some View {
        Text("IBan Scan").font(.title).bold()
    }
    
    var dataScanner: some View {
        DataScannerVC(scannedText: $scannedText, liveScan: $liveScan)
            .frame(height: 300)
            .cornerRadius(15)
            .shadow(radius: 10)
    }
    
    var dismissButton: some View {
        ActionButton(text: "Cancel") {
            dismiss()
        }
    }
}

#Preview {
    LiveTextFromCameraScan(liveScan: .constant(false), scannedText: .constant(""))
}


