//
//  TransactionSummaryView.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import Foundation

import SwiftUI

struct TransactionSummaryView: View {
    @ObservedObject var viewModel: TransactionSummaryViewModel
    
    var body: some View {
        HStack (alignment: .bottom){
            Text(NSLocalizedString("transactionsList.totalSpend.summaryText", comment: ""))
                .fontWeight(.regular)
                .secondary()
            Spacer()
            VStack(alignment: .trailing, spacing: 5){
                Text(viewModel.categoryTitle)
                    .font(.headline)
                    .foregroundColor(viewModel.spendCategoryTitleColor)
                Text(viewModel.totalSpend)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.accentColor, lineWidth: 2)
        )
        .padding(8)
        
    }
}

#if DEBUG
struct TransactionSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSummaryView(viewModel: TransactionSummaryViewModel(category: nil, totalSpend: 0))
    }
}
#endif
