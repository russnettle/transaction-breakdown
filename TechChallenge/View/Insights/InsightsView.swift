//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @ObservedObject var viewModel: InsightsViewModel
    
    var body: some View {
        List {
            RingView(viewModel: viewModel)
                .scaledToFit()
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(viewModel.accessibilityValues)
            
            ForEach(TransactionModel.Category.allCases) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text(viewModel.total(for: category))
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.title)
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(viewModel: InsightsViewModel(transactionViewModels: TransactionsViewModel(transactions: ModelData.sampleTransactions).transactions))
            .previewLayout(.sizeThatFits)
    }
}
#endif
