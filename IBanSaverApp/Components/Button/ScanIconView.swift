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
            .font(.system(size: 28))
            .imageScale(.large)
            .foregroundStyle(Color("ButtonColor"))
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    ScanIconView(action: {})
}
