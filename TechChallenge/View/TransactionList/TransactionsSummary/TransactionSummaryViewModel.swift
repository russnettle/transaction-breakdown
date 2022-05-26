//
//  TransactionSummaryViewModel.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionSummaryViewModel: ObservableObject{
    var categoryTitle: String
    var totalSpend: String
    var spendCategoryTitleColor: Color
    
    init(category:TransactionModel.Category?, totalSpend: Double) {
        self.spendCategoryTitleColor = category?.color ?? .black
        self.totalSpend = "$\(totalSpend.formatted())"
        self.categoryTitle = category?.rawValue ?? NSLocalizedString("transactionsList.categories.all", comment: "")
    }
    
}
