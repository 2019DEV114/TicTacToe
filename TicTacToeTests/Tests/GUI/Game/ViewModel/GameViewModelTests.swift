//
//  GameViewModelTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import XCTest
@testable import TicTacToe

final class GameViewModelTests: XCTestCase {

    private var sut: GameViewModel!

    override func setUp() {
        super.setUp()
        sut = GameViewModel()
    }

    // MARK: - Test defaults
    func testPresentationModelDefaultGridRowsCount() {
        // Then
        XCTAssertEqual(3, sut.presentationModel.grid.count)
    }

}
