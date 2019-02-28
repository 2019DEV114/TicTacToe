//
//  GameViewController.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {

    @IBOutlet weak var gridStackView: UIStackView!

    private var viewModel = GameViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.presentationModelDidChange = { [weak self] in
            self?.updateContent()
        }

        updateContent()
    }

    @IBAction func didPress(elementButton: GridElementButton) {
        viewModel.addMark(coordinateX: elementButton.coordinateX,
                          coordinateY: elementButton.coordinateY)
    }

    private func updateContent() {
        let presentationModel = viewModel.presentationModel
        
        let gridPresentationModel = presentationModel.grid
        for i in 0..<gridPresentationModel.count {
            for j in 0..<gridPresentationModel.count {
                let elementButton = gridStackView.elementButton(coordinateX: i, coordinateY: j)
                elementButton.presentationModel = gridPresentationModel[i][j]
            }
        }
    }
}

extension UIStackView {
    fileprivate func elementButton(coordinateX: Int, coordinateY: Int) -> GridElementButton {
        let columnStackView = arrangedSubviews[coordinateX] as! UIStackView
        return columnStackView.arrangedSubviews[coordinateY] as! GridElementButton
    }
}
