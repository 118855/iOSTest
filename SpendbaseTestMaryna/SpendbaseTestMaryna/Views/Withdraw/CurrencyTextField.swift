//
//  CurrencyTextField.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 29.05.2024.
//
import SwiftUI
import UIKit

class CurrencyFieldCoordinator: NSObject, UITextFieldDelegate {
    @Binding var text: String
    @Binding var isError: Bool
    @Binding var isButtonDisabled: Bool
    var formatter: NumberFormatter
    let balance: Double
    
    init(text: Binding<String>, isError: Binding<Bool>, isButtonDisabled: Binding<Bool>, balance: Double, formatter: NumberFormatter) {
        self._text = text
        self._isError = isError
        self._isButtonDisabled = isButtonDisabled
        self.balance = balance
        self.formatter = formatter
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        if string == "," {
            textField.text = currentText + "."
            text = textField.text ?? ""
            return false
        }
        
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        let cleanText = newText.replacingOccurrences(of: ",", with: "")
        let components = cleanText.split(separator: ".")
        
        if components.count > 1 {
            let decimalPart = components[1]
            if decimalPart.count > 2 {
                return false
            }
        }
        
        if let integerPart = components.first, let integerNumber = Int(integerPart) {
            let enteredAmount = Double(cleanText.replacingOccurrences(of: ".", with: ".")) ?? 0.0
            isError = enteredAmount > balance
            isButtonDisabled = enteredAmount <= 0 || isError
            
            if let formattedIntegerPart = formatter.string(from: NSNumber(value: integerNumber)) {
                if components.count > 1 {
                    let decimalPart = components[1]
                    textField.text = formattedIntegerPart + "." + decimalPart
                    text = formattedIntegerPart + "." + decimalPart
                } else {
                    textField.text = formattedIntegerPart
                    text = formattedIntegerPart
                }
            } else {
                textField.text = newText
                text = newText
            }
            return false
        }
        
        text = newText
        return true
    }
}

struct CurrencyTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isError: Bool
    @Binding var isButtonDisabled: Bool
    var formatter: NumberFormatter
    let balance: Double
    
    func makeCoordinator() -> CurrencyFieldCoordinator {
        return CurrencyFieldCoordinator(text: $text, isError: $isError, isButtonDisabled: $isButtonDisabled, balance: balance, formatter: formatter)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.placeholder = "0"
        textField.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        textField.textColor = .black
        textField.frame.size.height = 41
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    static func calculateTextWidth(text: String, font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}
