//
//  APIService.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchCards(teamId: String) async throws -> [Card] {
        guard let url = Bundle.main.url(forResource: "CardsMockData", withExtension: "json") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Cards.self, from: data)
        return result.cards
    }
    
    func fetchTransactions(teamId: String) async throws -> [Transaction] {
        guard let url = Bundle.main.url(forResource: "TransactionsMockData", withExtension: "json") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Transactions.self, from: data)
        return result.transactions
    }
    
    func fetchBalance(teamId: String) async throws -> Balance {
        guard let url = Bundle.main.url(forResource: "BalanceMockData", withExtension: "json") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Balance.self, from: data)
        print(result)
        return result
    }
}
