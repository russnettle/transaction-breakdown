//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionsViewModel
    
    var body: some View {
        VStack {
            TransactionCategoriesView { selectedCategory in
                viewModel.selectedCategory = selectedCategory
            }
            List {
                ForEach(viewModel.filteredCategories) { transactionViewModel in
                    TransactionView(viewModel: transactionViewModel) { isPinned in
                        viewModel.updateTotalSpend()
                    }
                }.listRowBackground(Color.clear)
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .listRowBackground(Color.clear)
            TransactionSummaryView(viewModel: viewModel.totalSpendViewModel)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionsViewModel(transactions: ModelData.sampleTransactions))
    }
}
#endif
