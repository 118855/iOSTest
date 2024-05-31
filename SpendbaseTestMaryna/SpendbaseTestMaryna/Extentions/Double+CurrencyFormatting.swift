//
//  Double+CurrencyFormatting.swift
//  SpendbaseTestMaryna
//
//  Created by Maryna Poliakova-Bilous on 30.05.2024.
//

import Foundation

extension Double {
    func formattedAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let formattedNumber = formatter.string(from: NSNumber(value: self)) ?? "0.00"
        return "€\(formattedNumber)"
    }
}
