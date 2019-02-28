//
//  GameModel.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import Foundation

final class GameModel {
    
    static let gridLength = 3
    
    let player1 = PlayerMarkModel.x
    let player2 = PlayerMarkModel.o
    /// Whose turn it is.
    private(set) var currentlyPlaying: PlayerMarkModel?

    /**
    A 3x3 matrix holding the game's marks.
    Each element can be X, O or nil. nil means the position hasn't been played.
     ```
    (0, 0) | (1, 0) | (2, 0)
    (0, 1) | (1, 1) | (2, 1)
    (0, 2) | (1, 2) | (2, 2)
     ```
     */
    private(set) var grid: [[PlayerMarkModel?]]

    /// The result of the game. nil means the game is playing.
    private(set) var result: GameResultModel?
    var isGameFinished: Bool {
        return result != nil
    }

    init() {
        currentlyPlaying = player1
        let emptyColumn = [PlayerMarkModel?](repeating: nil, count: GameModel.gridLength)
        grid = [[PlayerMarkModel?]](repeating: emptyColumn, count: GameModel.gridLength)
    }

    func addMark(coordinateX: Int, coordinateY: Int) {
        precondition(coordinateX < grid.count)
        precondition(coordinateY < grid.count)
        precondition(isGameFinished == false)
        precondition(grid[coordinateX][coordinateY] == nil)
        
        grid[coordinateX][coordinateY] = currentlyPlaying
        updateResultIfNeeded()
        updateCurrentlyPlayingPlayer()
    }
    
    private func updateResultIfNeeded() {
        if let playerMark = grid.winnerOnVerticalAxis() {
            result = .winner(playerMark)
            return
        }

        if let playerMark = grid.winnerOnHorizontalAxis() {
            result = .winner(playerMark)
            return
        }

        if let playerMark = grid.winnerOnDiagonals() {
            result = .winner(playerMark)
            return
        }

        if grid.allPositionsPlayed() == true {
            result = GameResultModel.draw
            return
        }
    }
    
    private func updateCurrentlyPlayingPlayer() {
        guard isGameFinished == false else {
            currentlyPlaying = nil
            return
        }
        
        currentlyPlaying = currentlyPlaying == player1 ? player2 : player1
    }
}

extension Array where Element == [PlayerMarkModel?] {
    fileprivate func winnerOnVerticalAxis() -> PlayerMarkModel? {
        rowsLoop: for i in 0..<count {
            guard let first = self[i][0] else { continue rowsLoop }
            columnsLoop: for j in 1..<count {
                guard self[i][j] == first else { continue rowsLoop }
            }
            return first
        }
        return nil
    }

    fileprivate func winnerOnHorizontalAxis() -> PlayerMarkModel? {
        columnsLoop: for j in 0..<count {
            guard let first = self[0][j] else { continue columnsLoop }
            rowsLoop: for i in 1..<count {
                guard self[i][j] == first else { continue columnsLoop }
            }
            return first
        }
        return nil
    }

    fileprivate func winnerOnDiagonals() -> PlayerMarkModel? {
        // Check if all marks are the same on the diagonal top left(0, 0) -> bottom right(2, 2)
        var first = self[0][0]
        var remainingElements = (1..<count).map { self[$0][$0] }
        if remainingElements.allSatisfy({ $0 == first }) {
            return first
        }

        // Check if all marks are the same on the diagonal top right(2, 0) -> bottom left(0, 2)
        first = self[count - 1][0]
        remainingElements = (1..<count).map { self[count - 1 - $0][$0] }
        if remainingElements.allSatisfy({ $0 == first }) {
            return first
        }
        
        return nil
    }

    fileprivate func allPositionsPlayed() -> Bool {
        let countAllPossiblePositions = count * count
        let flattenElements = joined()
        let playedPositions = flattenElements.compactMap({ $0 })
        return playedPositions.count == countAllPossiblePositions
    }
}
