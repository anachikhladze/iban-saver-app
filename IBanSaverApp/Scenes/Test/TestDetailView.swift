//
//  TestDetailView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 10.01.24.


import SwiftUI

struct TestDetailView: View {
    @EnvironmentObject var flowController: FlowCoordinator
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Detail view content")
            Button("Dismiss", action: flowController.closeDetailView)
            Text("Test Detail View")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.orange)
    }
}
