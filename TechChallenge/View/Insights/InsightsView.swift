//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @ObservedObject var insightsViewModel: InsightsViewModel
    
    var body: some View {
        List {
            RingView(insightsViewModel: insightsViewModel)
                .scaledToFit()
            
            ForEach(TransactionModel.Category.allCases) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text(insightsViewModel.total(for: category))
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(insightsViewModel: InsightsViewModel(transactionViewModels: []))
            .previewLayout(.sizeThatFits)
    }
}
#endif
