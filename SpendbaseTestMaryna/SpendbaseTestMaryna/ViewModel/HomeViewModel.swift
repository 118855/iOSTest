//
//  HomeViewModel.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var transactions: [Transaction] = []
    @Published var balance: Balance = Balance(balance: 0)
    
    let teamId = "team_id"
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor
    func fetchData() async {
        do {
            self.cards = try await APIService.shared.fetchCards(teamId: teamId)
            self.transactions = try await APIService.shared.fetchTransactions(teamId: teamId)
            self.balance = try await APIService.shared.fetchBalance(teamId: teamId)
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
}
