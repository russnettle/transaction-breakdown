//
//  TransactionCategoriesView.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import Foundation

import SwiftUI

struct TransactionCategoriesView: View {
    
    let viewModel: TransactionCategoriesViewModel = TransactionCategoriesViewModel()
    var categorySelectionHandler: (TransactionModel.Category?) -> Void
    
    init(categorySelectionHandler: @escaping (TransactionModel.Category?) -> Void) {
        self.categorySelectionHandler = categorySelectionHandler
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { value in
                HStack(spacing: 7) {
                    Button(action: {
                        categorySelectionHandler(nil)
                        withAnimation {
                            value.scrollTo(viewModel.allCategoriesText, anchor: .center)
                        }
                    }) {
                        Text( viewModel.allCategoriesText)
                            .category()
                    }.category(color: .black)
                    
                    ForEach(viewModel.categories) { transactionCategory in
                        Button(action: {
                            categorySelectionHandler(transactionCategory)
                            withAnimation {
                                value.scrollTo(transactionCategory.rawValue, anchor: .center)
                            }
                        }) {
                            Text(transactionCategory.rawValue)
                                .category()
                        }
                        .category(color: transactionCategory.color)
                    }
                }.padding(.leading, 10)
                .accessibilityHint(viewModel.accessibilityHint)
                
            }
        }
        .padding( .vertical, 15)
            .background(Color.accentColor.opacity(0.8))
        
        
    }
    
}

struct TransactionCategoriesView_Previews: PreviewProvider {
    static var categorySelectionHandler: (TransactionModel.Category?) -> Void = { _ in }
    static var previews: some View {
        TransactionCategoriesView(categorySelectionHandler: categorySelectionHandler)
    }
}
