//
//  PlayerMarkModel.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import Foundation

enum PlayerMarkModel {
    case x
    case o
}

extension PlayerMarkModel: Equatable {}

extension PlayerMarkModel {
    func displayedText() -> String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}
