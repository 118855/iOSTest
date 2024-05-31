//
//  BalanceView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI

struct BalanceView: View {
    let balance: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("euFlagImage")
                    Text("EUR account")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                
                Text("\(String(balance.formattedAsCurrency()))")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
    }
}

