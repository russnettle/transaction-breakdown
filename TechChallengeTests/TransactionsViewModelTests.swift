//
//  TransactionsViewModelTests.swift
//  TechChallengeTests
//
//  Created by Russell Freeman on 26/05/2022.
//

import XCTest
@testable import TechChallenge

class TransactionsViewModelTests: XCTestCase {

    func testInitalValues() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        XCTAssertEqual(viewModel.filteredCategories.count, sampleTransactions.count)
    }
    
    func testFilteredByFoodCount() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .food
         
        XCTAssertEqual(viewModel.filteredCategories.count, 5)
    }
    
    func testFilteredByHealthCount() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
       
        viewModel.selectedCategory = .health
         
        XCTAssertEqual(viewModel.filteredCategories.count, 1)
    }
    
    func testFilteredByEntertainmentCount() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
       
        viewModel.selectedCategory = .entertainment
         
        XCTAssertEqual(viewModel.filteredCategories.count, 1)
    }
    
    func testFilteredByShoppingCount() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .shopping
         
        XCTAssertEqual(viewModel.filteredCategories.count, 3)
    }
    
    func testFilteredByTravelCount() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
       
        viewModel.selectedCategory = .travel
         
        XCTAssertEqual(viewModel.filteredCategories.count, 3)
    }
    
    
}
