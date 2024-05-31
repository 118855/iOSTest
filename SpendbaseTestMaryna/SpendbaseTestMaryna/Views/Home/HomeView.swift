//
//  HomeView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    BalanceView(balance: viewModel.balance.balance)
                        .padding([.horizontal, .bottom, .top])
                    
                    SectionView(title: "My cards", destination: Text("All Cards")) {
                        VStack(spacing: 10) {
                            ForEach(viewModel.cards) {
                                card in CardView(cardName: card.cardName, cardLast4: card.cardLast4)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
                    SectionView(title: "Recent transactions", destination: Text("All Transactions")) {
                        VStack(spacing: 10) {
                            ForEach(viewModel.transactions) {
                                transaction in TransactionView(transaction: transaction)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .navigationTitle("Money")
        .navigationBarItems(trailing: Button(action: {
            showModal.toggle()
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $showModal, content: {
            WithdrawView(balance: viewModel.balance.balance)
        })
    }
}

#Preview {
    HomeView()
}
