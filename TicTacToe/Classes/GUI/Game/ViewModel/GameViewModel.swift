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
        let isGamePlaying = game.isGameFinished == false

        if let result = game.result {
            // The game has finished. Show its result.
            newPresentationModel.status = result.displayedText()
        } else if let playerMarkText = game.currentlyPlaying?.displayedText() {
            // The game is playing. Show whose turn it is.
            newPresentationModel.status = "\(playerMarkText)'s turn"
        }

        for indexAxisX in 0..<game.grid.count {
            let columnModel = game.grid[indexAxisX]
            var displayedColumn = [GridElementPresentationModel]()
            for markModel in columnModel {
                var displayedElementModel = GridElementPresentationModel(markModel)
                let isElementUnmarked = markModel == nil
                displayedElementModel.isUserInteractionEnabled = isElementUnmarked && isGamePlaying
                displayedColumn.append(displayedElementModel)
            }
            newPresentationModel.grid.append(displayedColumn)
        }

        presentationModel = newPresentationModel
    }
}

extension GameResultModel {
    fileprivate func displayedText() -> String {
        switch self {
        case .draw:
            return "Draw"
        case .winner(let player):
            return "\(player.displayedText()) won!"
        }
    }
}
