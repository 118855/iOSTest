//
//  TransactionView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    
    private var amount: String {
        transaction.amount.hasPrefix("-") ?
        "-€\(transaction.amount.dropFirst())" : "€\(transaction.amount)"
    }
    
    private var amountColor: Color {
        switch transaction.tribeTransactionType {
        case .load:
            return .green
        default:
            return transaction.status == .notCompleted ? .gray : .black
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            
            ZStack {
                Image(transaction.tribeTransactionType == .load ? "loadTransactionIcon" : "cardTransactionIcon")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                if transaction.status == .notCompleted {
                    GeometryReader { geometry in
                        Circle()
                            .fill(Color.red)
                            .frame(width: 12, height: 12)
                            .position(x: geometry.size.width - 5, y: 35)
                            .offset(x: 0, y: 0)
                    }
                }
            }
            .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchantName)
                    .font(.body)
                if let pan = transaction.pan {
                    Text("••\(pan)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 4) {
                Text(amount)
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
                    .foregroundColor(transaction.tribeTransactionType == .load ? .green : (transaction.status == .notCompleted ? .gray : .black))
                    .padding(.trailing, transaction.status == .detailsAvailable ? 0 : 20)
                
                if transaction.status == .detailsAvailable {
                    Image("yellowReceiptIcon")
                }
            }
        }
    }
}



