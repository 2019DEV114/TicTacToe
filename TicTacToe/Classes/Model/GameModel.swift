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

    init() {
        let emptyColumn = [PlayerMarkModel?](repeating: nil, count: GameModel.gridLength)
        grid = [[PlayerMarkModel?]](repeating: emptyColumn, count: GameModel.gridLength)
    }
    
    func add(mark: PlayerMarkModel, coordinateX: Int, coordinateY: Int) {
        precondition(coordinateX < grid.count)
        precondition(coordinateY < grid.count)

        grid[coordinateX][coordinateY] = mark
    }
}
