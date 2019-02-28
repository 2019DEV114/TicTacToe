//
//  GridElementPresentationModel.swift
//  TicTacToe
//
//  Created by 2019_DEV_114 on 2/28/19.
//  Copyright © 2019 2019_DEV_114. All rights reserved.

import Foundation

struct GridElementPresentationModel {
    var text: String?
    var isUserInteractionEnabled = true
}

extension GridElementPresentationModel: Equatable {}
