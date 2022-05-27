//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    @ObservedObject var viewModel: TransactionsViewModel = TransactionsViewModel(transactions: ModelData.sampleTransactions)

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView(viewModel: viewModel)
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView(insightsViewModel: InsightsViewModel(transactionViewModels: viewModel.transactions))
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
        }
    }
}
