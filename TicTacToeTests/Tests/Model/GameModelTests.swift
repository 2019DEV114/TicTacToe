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
        sut.addMark(coordinateX: 0, coordinateY: 0)
   
        // Then
        XCTAssertEqual(PlayerMarkModel.x, sut.grid[0][0])
    }
    
    // MARK: - Test currently playing player
    func testDefaultCurrentlyPlayingPlayer() {
        // Then
        XCTAssertEqual(PlayerMarkModel.x, sut.currentlyPlaying)
    }
    
    func testAddingOneMarkChangesCurrentPlayingPlayer() {
        // When
        sut.addMark(coordinateX: 1, coordinateY: 1)
        
        // Then
        XCTAssertEqual(PlayerMarkModel.o, sut.currentlyPlaying)
    }
    
    func testAddingTwoMarksChangesCurrentPlayingPlayer() {
        // When
        addMarks(player1: [(1, 1)],
                 player2: [(2, 2)])
        
        // Then
        XCTAssertEqual(PlayerMarkModel.x, sut.currentlyPlaying)
    }

    // MARK: - Test result
    func testDefaultResultIsNil() {
        // Then
        XCTAssertNil(sut.result)
    }
    
    func testAllMovesMadeChangesStatusToDraw() {
        // When
        // X|O|X
        // X|X|O
        // O|X|O
        addMarks(player1: [(0, 0), (0, 1), (1, 1), (1, 2), (2, 0)],
                 player2: [(0, 2), (1, 0), (2, 1), (2, 2)])

        // Then
        XCTAssertEqual(GameResultModel.draw, sut.result)
    }
    
    func testThreeVerticalXChangesStatusToWinner() {
        // When
        // X|O|-
        // X|O|-
        // X|-|-
        addMarks(player1: [(0, 0), (0, 1), (0, 2)],
                 player2: [(1, 0), (1, 1)])
        
        // Then
        XCTAssertEqual(GameResultModel.winner(.x), sut.result)
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
