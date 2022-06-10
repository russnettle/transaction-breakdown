//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionsViewModel
    @State var showActionSheet: Bool = false
    
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
        }.toolbar{
            Button("Sort") {
                showActionSheet.toggle()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.title) .actionSheet(isPresented: $showActionSheet,
                                                       content: {
                                                           ActionSheet(title: Text(""), buttons: [
                                                            .default(Text(TransactionsViewModel.SortOrder.mostRecent.title)) {
                                                                viewModel.sortOrder = .mostRecent
                                                                showActionSheet = false
                                                            },
                                                                .default(Text(TransactionsViewModel.SortOrder.oldest.title)) {
                                                                    viewModel.sortOrder = .oldest
                                                                    showActionSheet = false
                                                                },
                                                            .default(Text("Cancel")) {
                                                                showActionSheet = false
                                                            }
                                                           
                                                           ])
                                              })
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionsViewModel(transactions: ModelData.sampleTransactions))
    }
}
#endif
