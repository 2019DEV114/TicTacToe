//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import Foundation

final class GameViewModel {
    private(set) var presentationModel = GamePresentationModel() {
        didSet {
            presentationModelDidChange()
        }
    }
    var presentationModelDidChange: () -> Void = { }

    private var game = GameModel()

    init() {
        updatePresentationModel()
    }

    func addMark(coordinateX: Int, coordinateY: Int) {
        game.addMark(coordinateX: coordinateX, coordinateY: coordinateY)
        updatePresentationModel()
    }

    private func updatePresentationModel() {
        var newPresentationModel = GamePresentationModel()
        
        for indexAxisX in 0..<game.grid.count {
            let columnModel = game.grid[indexAxisX]
            var displayedColumn = [GridElementPresentationModel]()
            for markModel in columnModel {
                let displayedElementModel = GridElementPresentationModel(markModel)
                displayedColumn.append(displayedElementModel)
            }
            newPresentationModel.grid.append(displayedColumn)
        }

        presentationModel = newPresentationModel
    }

}
