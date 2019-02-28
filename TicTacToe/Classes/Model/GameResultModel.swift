//
//  GameResultModel.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import Foundation

enum GameResultModel {
    case draw
    case winner(PlayerMarkModel)
}

extension GameResultModel: Equatable {}
