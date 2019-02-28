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

    // MARK: - Test add mark
    func testAddMarkZeroZeroChangesGridElementPresentationModel() {
        // When
        sut.addMark(coordinateX: 0, coordinateY: 0)
        
        // Then
        let expectedPresentationModel = GridElementPresentationModel(.x)
        XCTAssertEqual(expectedPresentationModel, sut.presentationModel.grid[0][0])
    }
    
    // MARK: - Utility
    private func addMarks(player1 player1Marks: [(Int, Int)], player2 player2Marks: [(Int, Int)]) {
        let minCount = min(player1Marks.count, player2Marks.count)
        for index in 0..<minCount {
            let player1Mark = player1Marks[index]
            sut.addMark(coordinateX: player1Mark.0, coordinateY: player1Mark.1)
            
            let player2Mark = player2Marks[index]
            sut.addMark(coordinateX: player2Mark.0, coordinateY: player2Mark.1)
        }
        
        if player1Marks.count > player2Marks.count, let lastPlayer1Mark = player1Marks.last {
            sut.addMark(coordinateX: lastPlayer1Mark.0, coordinateY: lastPlayer1Mark.1)
        }
    }
}
