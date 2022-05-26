//
//  TransactionCategoriesView.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

final class TransactionCategoriesViewModel: ObservableObject {
    lazy var categories: [TransactionModel.Category] = {
        TransactionModel.Category.allCases
    }()
    
    let allCategoriesText: String = NSLocalizedString("transactionsList.categories.all", comment: "")
    let accessibilityHint: String =  NSLocalizedString("transactionsList.categories.accessibility", comment: "")
}
