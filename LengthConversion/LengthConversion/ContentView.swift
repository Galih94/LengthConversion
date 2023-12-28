//
//  ContentView.swift
//  LengthConversion
//
//  Created by Galih Samudra on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var originalAmount = 0.0
    
    var body: some View {
        Form {
            Section("Original Amount") {
                TextField("Input Amount", value: $originalAmount, format: .number)
                    .keyboardType(.decimalPad)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
