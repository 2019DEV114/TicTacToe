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
        sut.addMark(coordinateX: 1, coordinateY: 1)
        sut.addMark(coordinateX: 2, coordinateY: 2)
        
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
        sut.addMark(coordinateX: 0, coordinateY: 0)
        sut.addMark(coordinateX: 0, coordinateY: 2)
        sut.addMark(coordinateX: 0, coordinateY: 1)
        sut.addMark(coordinateX: 1, coordinateY: 0)
        sut.addMark(coordinateX: 1, coordinateY: 1)
        sut.addMark(coordinateX: 2, coordinateY: 1)
        sut.addMark(coordinateX: 1, coordinateY: 2)
        sut.addMark(coordinateX: 2, coordinateY: 2)
        sut.addMark(coordinateX: 2, coordinateY: 0)

        // Then
        XCTAssertEqual(GameResultModel.draw, sut.result)
    }
}
