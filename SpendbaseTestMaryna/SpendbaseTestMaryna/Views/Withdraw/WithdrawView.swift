//
//  WithdrawView.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 28.05.2024.
//

import SwiftUI

struct WithdrawView: View {
    @State private var amount: String = ""
    @State private var isError: Bool = false
    @State private var isButtonDisabled: Bool = true
    
    @Environment(\.presentationMode) var presentationMode
    
    let balance: Double
    let font = UIFont.systemFont(ofSize: 34, weight: .bold)
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                
                CurrencyTextField(text: $amount, isError: $isError, isButtonDisabled: $isButtonDisabled, formatter: formatter, balance: balance)
                    .overlay {
                        Text("€")
                            .font(.system(size: 34, weight: .bold))
                            .offset(x: -CurrencyTextField.calculateTextWidth(text: amount, font: font) / 2 - 20, y: 0)
                    }
                    .padding(.bottom, 0)
                
                if isError {
                    VStack {
                        Text("You only have \(balance.formattedAsCurrency())")
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                        Text(" available in your balance")
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                    }
                    .frame(alignment: .center)
                    .padding(.top, 0)
                    
                } else {
                    VStack {
                        HStack {
                            Text("You have")
                                .foregroundColor(.gray)
                                .font(.system(size: 13))
                                .multilineTextAlignment(.center)
                            
                            Text(balance.formattedAsCurrency())
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        Text("available in your balance")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                    }
                    .frame(alignment: .center)
                    .padding(.top, 0)
                }
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isButtonDisabled ? Color("disabledButton") : Color.blue)
                        .cornerRadius(100)
                }
                .padding()
                .disabled(isButtonDisabled)
                
                Spacer()
            }
            .navigationTitle("Transfer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func checkForError() {
        let cleanAmount = amount.replacingOccurrences(of: ",", with: "")
        let enteredAmount = Double(cleanAmount) ?? 0.0
        isError = enteredAmount > balance
        isButtonDisabled = enteredAmount <= 0 || isError
        print("Amount: \(amount), Clean Amount: \(cleanAmount), Entered Amount: \(enteredAmount), isError: \(isError), isButtonDisabled: \(isButtonDisabled)")
    }
}

#Preview {
    WithdrawView(balance: 23)
}
