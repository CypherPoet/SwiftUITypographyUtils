// WalletTransactionInfo.swift
//
// Created by CypherPoet.
// ✌️
//

import Foundation


struct WalletTransactionInfo {
    let id: UUID = .init()
    
    var recipientName: String
    var recipientShortAddress: String
    var recipientImageURL: URL?
    var recipientLocalImageName: String?
    var transactionDate: Date
    var transactionAmount: Double
}


extension WalletTransactionInfo: Identifiable {}
extension WalletTransactionInfo: Hashable {}
