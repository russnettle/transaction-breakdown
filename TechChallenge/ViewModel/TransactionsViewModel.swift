//
//  TransactionsViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionsViewModel: ObservableObject {
    var transactions: [TransactionModel]
    
    @Published var selectedCategory: TransactionModel.Category?
    
    func filterCategories()-> [TransactionModel] {
        
        guard let category = selectedCategory else {
            return transactions
        }
        return transactions.filter {
            $0.category == category
        }
    }
    
    init(transactions: [TransactionModel]) {
        self.transactions = transactions
    }
    
    var filteredCategories:  [TransactionModel]  {
        guard let category = selectedCategory else {
            return transactions
        }
        return transactions.filter {
            $0.category == category
        }
    }
}
