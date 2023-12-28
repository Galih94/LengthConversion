//
//  ContentView.swift
//  LengthConversion
//
//  Created by Galih Samudra on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var originalAmount = 0.0
    @State private var originalLength = "m"
    
    let lenghts = ["m", "km", "feet", "yards", "miles"]
    
    var body: some View {
        Form {
            Section("Original Length") {
                TextField("Input Amount", value: $originalAmount, format: .number)
                    .keyboardType(.decimalPad)
                Picker("Original Length Conversion", selection: $originalLength) {
                    ForEach(lenghts, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ContentView()
}
