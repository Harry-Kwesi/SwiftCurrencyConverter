//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Harry Kwesi De Graft on 06/12/23.
//

import SwiftUI

struct ContentView: View {
       @State var amount: Double = 1.0
       @State var selectedCurrencyFrom = currencies[0]
       @State var selectedCurrencyTo = currencies[1]

       var convertedAmount: Double {
           let fromRate = selectedCurrencyFrom.rate
           let toRate = selectedCurrencyTo.rate
           return amount * (toRate / fromRate)
       }
    var body: some View {
        VStack {
                    Text("Currency Converter")
                        .font(.title)
                        .padding()

                    HStack {
                        TextField("Enter Amount", value: $amount, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Picker("From", selection: $selectedCurrencyFrom) {
                            ForEach(currencies, id: \.self) { currency in
                                Text(currency.code).tag(currency)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }

                    HStack {
                        Text("Converted Amount:")
                            .padding()

                        Text("\(convertedAmount, specifier: "%.2f") \(selectedCurrencyTo.code)")
                            .padding()
                    }

                    Picker("To", selection: $selectedCurrencyTo) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency.code).tag(currency)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    Spacer()
                }
                .padding()
            }
    }
struct Currency: Hashable {
    var code: String
    var rate: Double
}

let currencies: [Currency] = [
    Currency(code: "USD", rate: 1.0),
    Currency(code: "EUR", rate: 0.85),
    Currency(code: "GBP", rate: 0.75),
]

#Preview {
    ContentView()
}
