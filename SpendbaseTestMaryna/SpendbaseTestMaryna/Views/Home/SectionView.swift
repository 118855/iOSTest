//
//  SectionView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI

struct SectionView<Content: View, Destination: View>: View {
    let title: String
    let destination: Destination
    let content: Content
    
    init(title: String, destination: Destination, @ViewBuilder content: () -> Content) {
        self.title = title
        self.destination = destination
        self.content = content()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                Spacer()
                NavigationLink(destination: destination) {
                    Text("See All")
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                }
            }
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
    }
}
