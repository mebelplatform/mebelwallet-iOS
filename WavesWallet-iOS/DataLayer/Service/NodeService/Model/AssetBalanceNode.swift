//
//  AssetBalanceNodeService.swift
//  WavesWallet-iOS
//
//  Created by mefilt on 09.07.2018.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation

extension Node.Model {
    struct AssetBalance: Decodable {
        let address: String
        let balances: [Balance]
    }

    struct Balance: Decodable {
        let assetID: String
        let balance: Int64
        let reissuable: Bool
        let minSponsoredAssetFee: Int64?
        let sponsorBalance: Int64?
        let quantity: Int64
        let issueTransaction: IssueTransaction
    }

    struct IssueTransaction: Decodable {
        let type: Int64
        let id: String
        let sender: String
        let senderPublicKey: String
        let fee: Int64
        let timestamp: Int64
        let signature: String
        let version: Int64
        let assetID: String
        let name: String
        let quantity: Int64
        let reissuable: Bool
        let decimals: Int64
        let description: String
        let script: String?
    }
}
