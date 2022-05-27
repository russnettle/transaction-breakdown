//
//  TransactionsViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionsViewModel: ObservableObject {
    @Published var transactions: [TransactionViewModel]
    
    @Published var selectedCategory: TransactionModel.Category? {
        didSet {
            updateTotalSpend()
        }
    }
    @Published var totalSpendViewModel: TransactionSummaryViewModel = {
        TransactionSummaryViewModel(category: nil, totalSpend: 0)
    }()
    
    var filteredCategories: [TransactionViewModel]  {
        guard let category = selectedCategory else {
            return transactions
        }
        return transactions.filter {
            $0.transaction.category == category
        }
    }
    
    var totalSpend: Double {
        return filteredCategories.filter({!$0.isPinned}).reduce(0) {
            $0 + $1.transaction.amount
        }
    }
    
    init(transactions: [TransactionModel]) {
        var transactionViewModels = [TransactionViewModel]()
        
        for transaction in transactions {
            let transactionViewModel = TransactionViewModel(transaction: transaction)
            transactionViewModels.append(transactionViewModel)
        }
        self.transactions = transactionViewModels
        self.selectedCategory = nil
    }
    
    func updateTotalSpend() {
        totalSpendViewModel = TransactionSummaryViewModel(category: selectedCategory, totalSpend: totalSpend)
    }
    
    func filterCategories()-> [TransactionViewModel] {
        
        guard let category = selectedCategory else {
            return transactions
        }
        return transactions.filter {
            $0.transaction.category == category
        }
    }
    
    
    
    
}
