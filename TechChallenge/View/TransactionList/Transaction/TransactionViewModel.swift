//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionViewModel: ObservableObject, Identifiable {
    let transaction: TransactionModel
    let id: UUID = UUID()
    @Published var isPinned = false
    
    var accessibilityText: String {
        isPinned ? NSLocalizedString("transactionsList.unpin", comment: "") :  NSLocalizedString("transactionsList.pin", comment: "")
    }
    
    init(transaction: TransactionModel) {
        self.transaction = transaction
    }
}

