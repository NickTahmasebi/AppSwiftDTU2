//
//  CounterViewModelTests.swift
//  AppSwiftDTU
//
//  Created by Nick Tahmasebi on 03/06/2024.
//

import XCTest
@testable import AppSwiftDTU

class BasketTests: XCTestCase {
    
    var basket: Basket!
    
    override func setUp() {
        super.setUp()
        basket = Basket()
    }
    
    override func tearDown() {
        basket = nil
        super.tearDown()
    }
    
    func testIncrementCount() {
        // Given
        let product = Product(id: 1, name: "Test Product", image: "product_image", price: 10, description: "Product Description", color: [0.141])
        basket.addToBasket(product: product, count: 1)
        
        // When
        basket.incrementCount(for: product.id)
        
        // Then
        let updatedItem = basket.items.first(where: { $0.product.id == product.id })
        XCTAssertEqual(updatedItem?.count, 2)
    }

    func testDecrementCount() {
        // Given
        let product = Product(id: 2, name: "Another Test Product", image: "another_product_image", price: 20, description: "Another Description", color: [2])
        basket.addToBasket(product: product, count: 2)
        
        // When
        basket.decrementCount(for: product.id)
        
        // Then
        let updatedItem = basket.items.first(where: { $0.product.id == product.id })
        XCTAssertEqual(updatedItem?.count, 1)
    }
}






