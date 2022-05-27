//
//  InsightsViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import Foundation
import SwiftUI

final class InsightsViewModel: ObservableObject {
    struct CategoryViewModel {
        let ratio: Double
        let title: String
        let color: Color
        let offset: Double
        let total: String
        
        init(transactionViewModels: [TransactionViewModel], offset: Double, totalSpend: Double, category: TransactionModel.Category) {
            let categorySpend = transactionViewModels.reduce(0){$0 + $1.transaction.amount}
            self.total = "$\(categorySpend.formatted())"
            self.ratio = categorySpend / totalSpend
            self.offset = offset
            self.color = category.color
            self.title = category.rawValue
        }
    }
    
    var dataSource = [String: CategoryViewModel]()
    var totalSpend: Double
    
    init(transactionViewModels: [TransactionViewModel]) {
        totalSpend = transactionViewModels.filter{!$0.isPinned}.reduce(0){$0 + $1.transaction.amount}
        updateTransactionData(transactionViewModels: transactionViewModels)
    }
    
    func updateTransactionData(transactionViewModels: [TransactionViewModel]) {
        var currentOffset: Double = 0
        for category in  TransactionModel.Category.allCases {
            let transactions = transactionViewModels.filter({$0.transaction.category == category && !$0.isPinned})
            let categoryViewModel = CategoryViewModel(transactionViewModels: transactions, offset: currentOffset, totalSpend: totalSpend, category: category)
            currentOffset += categoryViewModel.ratio
            dataSource[category.rawValue] = categoryViewModel
        }
    }
    
    func total(for category: TransactionModel.Category) -> String {
       
        return dataSource[category.rawValue]?.total ?? "$0.0"
    }
    
    func ratioForCategoryIndex(for categoryIndex: Int) -> Double {
        guard let categoryViewModel = categoryViewModel(for: categoryIndex)
        else {
            return 0
            
        }
        return categoryViewModel.ratio
    }
    
    
    func offset(for categoryIndex: Int) -> Double {
        guard let categoryViewModel = categoryViewModel(for: categoryIndex)
        else {
            return 0
            
        }
        return categoryViewModel.offset 
    }
    
    func color(for categoryIndex: Int) -> Color {
        guard let categoryViewModel = categoryViewModel(for: categoryIndex)
        else {
            return .black
            
        }
        return categoryViewModel.color
    }
    
    func percentText(for categoryIndex: Int) -> String {
        "\((ratioForCategoryIndex(for: categoryIndex) * 100).formatted(hasDecimals: false))%"
    }
    
    
    private func categoryViewModel(for categoryIndex: Int) -> CategoryViewModel? {
        guard let category = TransactionModel.Category[categoryIndex]
        else {
            return nil
            
        }
        return dataSource[category.rawValue]
    }
    var accessibilityValues: String {
        var summaryString = ""
        for categoryIndex in TransactionModel.Category.allCases.indices {
            let title = TransactionModel.Category[categoryIndex]?.rawValue ?? ""
            let category = NSLocalizedString("insights.category", comment: "")
            let spend = NSLocalizedString("insights.spend", comment: "")
            summaryString += "\(category) \(title), \(spend) \(percentText(for: categoryIndex)). \n"
        }
        return summaryString
    }
}
