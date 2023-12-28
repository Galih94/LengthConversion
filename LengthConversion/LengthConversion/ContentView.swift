//
//  ContentView.swift
//  LengthConversion
//
//  Created by Galih Samudra on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var originalAmount = 0.0
    @State private var originalLength = Length.m.rawValue
    @State private var outputLength = Length.m.rawValue
    
    enum Length: String {
        case m, km, feet, yards, miles
        
        var numberValue: Double {
            switch self {
            case .m:
                return 1
            case .km:
                return 1000
            case .feet:
                return 0.3048
            case .yards:
                return 0.9144
            case .miles:
                return 1_609.344
            }
        }
    }
    
    let lenghts = [Length.m.rawValue, Length.km.rawValue, Length.feet.rawValue, Length.yards.rawValue, Length.miles.rawValue]
    
    private var outputAmount: Double {
        let ogLength = Length(rawValue: originalLength) ?? Length.m
        let input = originalAmount * ( ogLength.numberValue / Length.m.numberValue )
        let otLength = Length(rawValue: outputLength) ?? Length.m
        let output = input / otLength.numberValue
        
        return output
    }
    
    var body: some View {
        Form {
            Section("Input Length") {
                TextField("Input Amount", value: $originalAmount, format: .number)
                    .keyboardType(.decimalPad)
                Picker("Original Length Conversion", selection: $originalLength) {
                    ForEach(lenghts, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Output Length") {
                Text(outputAmount, format: .number)
                Picker("Original Length Conversion", selection: $outputLength) {
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
