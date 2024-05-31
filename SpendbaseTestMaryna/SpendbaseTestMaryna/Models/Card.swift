//
//  Card.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import Foundation

// MARK: - CardHolder
struct CardHolder: Codable, Identifiable {
    let id: String
    let fullName: String
    let email: String
    let logoUrl: String
}

// MARK: - Card
struct Card: Codable, Identifiable {
    let id: String
    let cardLast4: String
    let cardName: String
    let isLocked: Bool
    let isTerminated: Bool
    let spent: Int
    let limit: Int
    let limitType: String
    let cardHolder: CardHolder
    let fundingSource: String
    let issuedAt: String
}

// MARK: - Cards
struct Cards: Codable {
    let cards: [Card]
}

