//
//  GridElementButton.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import UIKit

final class GridElementButton: UIButton {
    @IBInspectable var coordinateX: Int = 0
    @IBInspectable var coordinateY: Int = 0
    
    var presentationModel: GridElementPresentationModel? {
        didSet {
            guard let presentationModel = presentationModel else { return }
            setTitle(presentationModel.text, for: .normal)
            isUserInteractionEnabled = presentationModel.isUserInteractionEnabled
        }
    }
}
