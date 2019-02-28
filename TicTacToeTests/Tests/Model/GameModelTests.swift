//
//  GameModelTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import XCTest
@testable import TicTacToe

final class GameModelTests: XCTestCase {

    private var sut: GameModel!

    override func setUp() {
        super.setUp()
        sut = GameModel()
    }
    
    // MARK: - Test defaults
    func testDefaultGridElementZeroZeroIsNil() {
        // Then
        XCTAssertNil(sut.grid[0][0])
    }
    
    // MARK: - Test grid
    func testAddMarkZeroZeroChangesGridValue() {
        // When
        sut.add(mark: .x, coordinateX: 0, coordinateY: 0)
   
        // Then
        XCTAssertEqual(PlayerMarkModel.x, sut.grid[0][0])
    }
}
