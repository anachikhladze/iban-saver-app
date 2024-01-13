//
//  DataScannerVC.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 12.01.24.
//

import SwiftUI
import VisionKit

struct DataScannerVC: UIViewControllerRepresentable {
    //MARK: - Properties
    @Binding var scannedText: String
    @Binding var liveScan: Bool
    
    //MARK: - Methods
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(recognizedDataTypes: [.text()],
                                                       qualityLevel: .balanced,
                                                       isHighlightingEnabled: true)
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if liveScan {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    //MARK: - Coordinator
    final class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScannerVC
        init(parent: DataScannerVC) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                if isValidIBANFormat(text.transcript) {
                    parent.scannedText = text.transcript
                } else {
                    //TODO: - Handle not ValidIban
                }
                parent.liveScan = false
            default:
                break
            }
        }
        
        func isValidIBANFormat(_ iban: String) -> Bool {
            if iban.count < 15 || iban.count > 33 {
                return false
            }
            
            let firstTwoCharacters = iban.prefix(2)
            let lettersCharacterSet = CharacterSet.uppercaseLetters
            
            return firstTwoCharacters.rangeOfCharacter(from: lettersCharacterSet) != nil
        }
    }
}
