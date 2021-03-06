//
//  WalletTypes.swift
//  WavesWallet-iOS
//
//  Created by mefilt on 05.07.2018.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation
import RxDataSources
import UIKit

enum WalletTypes {}

extension WalletTypes {
    enum ViewModel {}
    enum DTO {}
}

extension WalletTypes {
    enum Display {
        case assets
        case leasing
    }

    struct State {
        enum AnimateType  {
            case refresh
            case collapsed(Int)
            case expanded(Int)
        }

        struct DisplayState {
            var sections: [ViewModel.Section]
            var collapsedSections: [Int: Bool]
            var isRefreshing: Bool
            var animateType: AnimateType = .refresh
        }

        var display: Display
        var assets: DisplayState
        var leasing: DisplayState
    }

    enum Event {
        case none
        case responseAssets([DTO.Asset])
        case responseLeasing(DTO.Leasing)
        case refresh
        case readyView
        case tapSection(Int)
        case changeDisplay(Display)
    }
}

extension WalletTypes.Display {

    var name: String {
        switch self {
        case .assets:
            return "Assets"
        case .leasing:
            return "Leasing"
        }
    }
}
