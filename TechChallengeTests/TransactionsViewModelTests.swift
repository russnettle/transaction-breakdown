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
    
    func testFoodCategoryTotal() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .food
         
        XCTAssertEqual(viewModel.totalSpend, 74.28)
    }
    
    func testHealthCategoryTotal() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .health
         
        XCTAssertEqual(viewModel.totalSpend, 21.53)
    }
    
    func testEntertainmentCategoryTotal() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .entertainment
         
        XCTAssertEqual(viewModel.totalSpend, 82.99)
    }
    
    func testShoppingCategoryTotal() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .shopping
         
        XCTAssertEqual(viewModel.totalSpend, 78.00)
    }
    
    func testTravelCategoryTotal() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = .travel
         
        XCTAssertEqual(viewModel.totalSpend, 215.28)
    }
    
    func testALLCategoriesTotal() {
        let sampleTransactions = ModelData.sampleTransactions
        let viewModel: TransactionsViewModel = TransactionsViewModel(transactions: sampleTransactions)
        
        viewModel.selectedCategory = nil
         
        XCTAssertEqual(viewModel.totalSpend, 472.08)
    }
}
