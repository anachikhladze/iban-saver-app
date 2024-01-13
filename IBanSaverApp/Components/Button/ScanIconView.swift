//
//  scanIconView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 13.01.24.
//

import SwiftUI

struct ScanIconView: View {
    var action: () -> Void
    
    var body: some View {
        Image(systemName: "camera.viewfinder")
            .font(.title2)
            .imageScale(.large)
            .foregroundStyle(Color(red: 1, green: 96/255, blue: 10/255))
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    ScanIconView(action: {})
}
