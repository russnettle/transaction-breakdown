//
//  InsightsViewModelTests.swift
//  TechChallengeTests
//
//  Created by Russell Freeman on 27/05/2022.
//

import XCTest

@testable import TechChallenge

class InsightsViewModelTests: XCTestCase {

    func testSpendTotalsForNoPinnedTransactions() {
        let sampleTransactions = ModelData.sampleTransactions
        let transactionsViewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        let viewModel = InsightsViewModel(transactionViewModels: transactionsViewModel.transactions)
        
        let foodTotal = viewModel.total(for: .food)
        let healthTotal = viewModel.total(for: .health)
        let entetainmentTotal = viewModel.total(for: .entertainment)
        let shoppingTotal = viewModel.total(for: .shopping)
        let travelTotal = viewModel.total(for: .travel)
        let total = viewModel.totalSpend
        
        XCTAssertEqual(foodTotal, "$74.28")
        XCTAssertEqual(healthTotal, "$21.53")
        XCTAssertEqual(entetainmentTotal, "$82.99")
        XCTAssertEqual(shoppingTotal, "$78.00")
        XCTAssertEqual(travelTotal, "$215.28")
        XCTAssertEqual(total, 472.0799999999999)
    }
    
    func testSpendTotalsForPinnedTransactions() {
        let sampleTransactions = ModelData.sampleTransactions
        let transactionsViewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        transactionsViewModel.transactions[0].isPinned = true
        transactionsViewModel.transactions[1].isPinned = true
        transactionsViewModel.transactions[2].isPinned = true
        let viewModel = InsightsViewModel(transactionViewModels: transactionsViewModel.transactions)
    
        
        let foodTotal = viewModel.total(for: .food)
        let healthTotal = viewModel.total(for: .health)
        let entetainmentTotal = viewModel.total(for: .entertainment)
        let shoppingTotal = viewModel.total(for: .shopping)
        let travelTotal = viewModel.total(for: .travel)
        let total = viewModel.totalSpend

        
        XCTAssertEqual(foodTotal, "$48.96")
        XCTAssertEqual(healthTotal, "$21.53")
        XCTAssertEqual(entetainmentTotal, "$0.00")
        XCTAssertEqual(shoppingTotal, "$23.40")
        XCTAssertEqual(travelTotal, "$215.28")
        XCTAssertEqual(total, 309.16999999999996)
    }

    func testRatiosNoPinnedTransactions() {
        let sampleTransactions = ModelData.sampleTransactions
        let transactionsViewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        let viewModel = InsightsViewModel(transactionViewModels: transactionsViewModel.transactions)
        
        let foodRatio = viewModel.ratioForCategoryIndex(for: 0)
        let healthRatio = viewModel.ratioForCategoryIndex(for: 1)
        let entetainmentRatio = viewModel.ratioForCategoryIndex(for: 2)
        let shoppingRatio = viewModel.ratioForCategoryIndex(for: 3)
        let travelRatio = viewModel.ratioForCategoryIndex(for: 4)
        
        let totalRatio = foodRatio + healthRatio + entetainmentRatio + shoppingRatio + travelRatio
        // rounding for the sake of a sane test  - eg //1.0000000000000002 into 1.00
        let roundedTotalRatio  = (totalRatio * 100).rounded()/100
        XCTAssertEqual(foodRatio, 0.1573462125063549)
        XCTAssertEqual(healthRatio, 0.04560667683443485)
        XCTAssertEqual(entetainmentRatio, 0.1757964751736994)
        XCTAssertEqual(shoppingRatio, 0.16522623284189122)
        XCTAssertEqual(travelRatio, 0.4560244026436198)
        XCTAssertEqual(roundedTotalRatio, 1.00)
    }
    
    func testRatiosWithPinnedTransactions() {
        let sampleTransactions = ModelData.sampleTransactions
        let transactionsViewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        transactionsViewModel.transactions[3].isPinned = true
        transactionsViewModel.transactions[2].isPinned = true
        transactionsViewModel.transactions[7].isPinned = true
        let viewModel = InsightsViewModel(transactionViewModels: transactionsViewModel.transactions)
        
        let foodRatio = viewModel.ratioForCategoryIndex(for: 0)
        let healthRatio = viewModel.ratioForCategoryIndex(for: 1)
        let entetainmentRatio = viewModel.ratioForCategoryIndex(for: 2)
        let shoppingRatio = viewModel.ratioForCategoryIndex(for: 3)
        let travelRatio = viewModel.ratioForCategoryIndex(for: 4)
        
        let totalRatio = foodRatio + healthRatio + entetainmentRatio + shoppingRatio + travelRatio
        // rounding for the sake of a sane test  - eg //1.0000000000000002 into 1.00
        let roundedTotalRatio  = (totalRatio * 100).rounded()/100
        XCTAssertEqual(foodRatio, 0.0930411936269193)
        XCTAssertEqual(healthRatio, 0.0)
        XCTAssertEqual(entetainmentRatio, 0.20003856629787647)
        XCTAssertEqual(shoppingRatio, 0.18801070214766077)
        XCTAssertEqual(travelRatio, 0.5189095379275437)
        XCTAssertEqual(roundedTotalRatio, 1.00)
        
    }
    
    func testOffsetsWithNoPinnedTransactions() {
        let sampleTransactions = ModelData.sampleTransactions
        let transactionsViewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        let viewModel = InsightsViewModel(transactionViewModels: transactionsViewModel.transactions)
        
        let foodOffset = viewModel.offset(for: 0)
        let healthOffset = viewModel.offset(for: 1)
        let entetainmentOffset = viewModel.offset(for: 2)
        let shoppingOffset = viewModel.offset(for: 3)
        let travelOffset = viewModel.offset(for: 4)
        
        
        XCTAssertEqual(foodOffset, 0.0)
        XCTAssertEqual(healthOffset, 0.1573462125063549)
        XCTAssertEqual(entetainmentOffset, 0.20295288934078975)
        XCTAssertEqual(shoppingOffset, 0.37874936451448915)
        XCTAssertEqual(travelOffset, 0.5439755973563803)
    }
    
    func testOffsetsWithPinnedTransactions() {
        let sampleTransactions = ModelData.sampleTransactions
        let transactionsViewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        transactionsViewModel.transactions[3].isPinned = true
        transactionsViewModel.transactions[2].isPinned = true
        transactionsViewModel.transactions[7].isPinned = true
        let viewModel = InsightsViewModel(transactionViewModels: transactionsViewModel.transactions)
        
        let foodOffset = viewModel.offset(for: 0)
        let healthOffset = viewModel.offset(for: 1)
        let entetainmentOffset = viewModel.offset(for: 2)
        let shoppingOffset = viewModel.offset(for: 3)
        let travelOffset = viewModel.offset(for: 4)
        
        XCTAssertEqual(foodOffset, 0.0)
        XCTAssertEqual(healthOffset, 0.0930411936269193)
        XCTAssertEqual(entetainmentOffset, 0.0930411936269193)
        XCTAssertEqual(shoppingOffset, 0.2930797599247958)
        XCTAssertEqual(travelOffset, 0.48109046207245654)
    }
    
}
