//
//  PlaceholderView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 29.05.2024.
//

import SwiftUI

struct PlaceholderView: View {
    
    var body: some View {
        VStack{
            Image("placeholder")
                .padding()
            Text("Coming soon")
                .fontWeight(.medium)
                .font(.system(size: 15))
                .foregroundColor(Color("textSecondary"))
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("background"))
    }
}

#Preview {
    PlaceholderView()
}
