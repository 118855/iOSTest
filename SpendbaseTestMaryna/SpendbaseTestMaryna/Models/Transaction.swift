//
//  Transaction.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import Foundation

// MARK: - TribeTransactionType
enum TribeTransactionType: String, Codable {
    case load = "Load"
    case card = "Card"
    case refund = "Refund"
}

// MARK: - TransactionStatus
enum TransactionStatus: String, Codable {
    case completed = "Completed"
    case notCompleted = "NotCompleted"
    case detailsAvailable = "DetailsAvailable"
    case failed = "Failed"
}

// MARK: - Transaction
struct Transaction: Codable, Identifiable {
    let id: String
    let tribeTransactionId: String
    let tribeCardId: Int
    let amount: String
    let status: TransactionStatus
    let tribeTransactionType: TribeTransactionType
    let schemeId: String
    let merchantName: String
    let pan: String?
}

// MARK: - Transactions
struct Transactions: Codable {
    let transactions: [Transaction]
}
