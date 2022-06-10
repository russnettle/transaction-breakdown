//
//  TransactionsViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionsViewModel: ObservableObject {
    
    enum SortOrder: String {
        case mostRecent
        case oldest
        case cancel
        
        var title: String {
            switch self {
            case .mostRecent:
                return NSLocalizedString("transactionsList.sortOrder.mostRecent", comment: "")
            case .oldest:
                return NSLocalizedString("transactionsList.sortOrder.oldest", comment: "")
            case .cancel:
                return NSLocalizedString("transactionsList.sortOrder.cancel", comment: "")
            }
        }
    }
    
    let title = NSLocalizedString("transactions.title", comment: "")
    @Published var transactions: [TransactionViewModel]
    
    @Published var selectedCategory: TransactionModel.Category? {
        didSet {
            filterCategories()
            updateTotalSpend()
        }
    }
    @Published var totalSpendViewModel: TransactionSummaryViewModel = {
        TransactionSummaryViewModel(category: nil, totalSpend: 0)
    }()
    
    var sortOrder: SortOrder?  {
        didSet {
            updateSortOrder()
        }
    }
    
   @Published var filteredCategories: [TransactionViewModel] = []
    
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
    
    func filterCategories(){
        guard let category = selectedCategory else {
            filteredCategories = transactions
            return
        }
        filteredCategories =  transactions.filter {
            $0.transaction.category == category
        }
        
        updateSortOrder()
    }
    
    func updateSortOrder() {
        guard let sortOrder = sortOrder else {
            return
        }
        
     switch sortOrder {
        case .mostRecent:
            filteredCategories = filteredCategories.sorted(by: {$0.transaction.date > $1.transaction.date})
        case .oldest:
            filteredCategories =  filteredCategories.sorted(by: {$0.transaction.date < $1.transaction.date})
        case .cancel:
            filteredCategories = transactions
        }

    }
    
}
