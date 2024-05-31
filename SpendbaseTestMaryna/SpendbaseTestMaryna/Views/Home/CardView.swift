//
//  CardView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI

struct CardView: View {
    let cardName: String
    let cardLast4: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 40, height: 32)
                .cornerRadius(4)
                .overlay(
                    GeometryReader { geometry in
                        Text(cardLast4)
                            .fontWeight(.medium)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .position(x: geometry.size.width - 15, y: geometry.size.height - 10)
                    }
                )
            Text(cardName)
                .fontWeight(.semibold)
                .font(.system(size: 15))
            Spacer()
        }
        .frame(height: 56)
    }
}
