//
//  IBanNumberView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 11.01.24.
//

import SwiftUI

struct IBanNumberView: View {
    // MARK: - Properties
    @EnvironmentObject var dataFlowViewModel: DataFlowViewModel
    var iban: IBANDetail
    var person: Person
    
    // MARK: - Body
    var body: some View {
        HStack {
            IBanDetails
            Spacer()
            actionButtons
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.rowBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Computed Properties
    private var IBanDetails: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(iban.bankName.rawValue)
                .bold()
                .foregroundStyle(Color.white)
                .font(.subheadline)
                .padding(.bottom, 2)
            
            Text("IBan Number")
                .foregroundStyle(Color(red: 1, green: 1, blue: 1, opacity: 0.65))
                .font(.footnote)
            
            Text(iban.ibanNumber)
                .foregroundStyle(.white).bold()
                .font(.subheadline)
                .textSelection(.enabled)
        }
    }
    
    private var actionButtons: some View {
        HStack {
            roundedIconButton(icon: "doc.on.doc") {
                UIPasteboard.general.string = iban.ibanNumber
            }
            ShareLink(item: iban.ibanNumber) {
                roundedIcon(icon: "square.and.arrow.up")
            }
            roundedIconButton(icon: "trash") {
                dataFlowViewModel.deleteIban(ibanDetail: iban, from: person.id)
            }
        }
    }
    
}

#Preview {
    IBanNumberView(iban: IBANDetail(bankName: .BOG, ibanNumber: "GE12312312"), person: mockupData.mockPersons[0])
}


