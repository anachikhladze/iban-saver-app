//
//  FlowCoordinator.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 10.01.24.
//

import SwiftUI
import UIKit

final class FlowCoordinator: ObservableObject {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootView() {
        let swiftUIView = TestView()
            .environmentObject(self)
        let hostingView = UIHostingController(rootView: swiftUIView)
        window.rootViewController = UINavigationController(rootViewController: hostingView)
    }
    
    func showDetailView() {
        let detailView = TestDetailView()
            .environmentObject(self)
        let viewController = UIHostingController(rootView: detailView)
        window.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func closeDetailView() {
        // Needs to be more sophisticated later when there are more views
        window.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
