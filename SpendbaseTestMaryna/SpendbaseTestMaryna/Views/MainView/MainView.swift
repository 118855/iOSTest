//
//  MainView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 30.05.2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                VStack {
                    Image("homeTabbarIcon")
                    Text("Home")
                }
            }
            
            NavigationView {
                TransactionsView()
            }
            .tabItem {
                VStack {
                    Image("transactionsTabbarIcon")
                    Text("Transactions")
                }
            }
            
            NavigationView {
                CardsView()
            }
            .tabItem {
                VStack {
                    Image("cardsTabbarIcon")
                    Text("My Cards")
                }
            }
            
            NavigationView {
                AccountView()
            }
            .tabItem {
                VStack {
                    Image("accountTabbarIcon")
                    Text("Account")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
