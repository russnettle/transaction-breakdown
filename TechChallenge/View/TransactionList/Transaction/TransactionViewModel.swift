//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionViewModel: ObservableObject {
    let transaction: TransactionModel
    @Published var isPinned = false
    
    init(transaction: TransactionModel) {
        self.transaction = transaction
    }
}

extension TransactionViewModel: Identifiable {
    var id: UUID {
        UUID()
    }
}
