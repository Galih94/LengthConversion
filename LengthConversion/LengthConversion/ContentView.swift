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
    
    enum Length: String {
        case m, km, feet, yards, miles
        
        var numberValue: Double {
            switch self {
            case .m:
                return 1
            case .km:
                return 1000
            case .feet:
                return 3.28084
            case .yards:
                return 1.0936133333333
            case .miles:
                return 0.00062137121212119323429
            }
        }
    }
    
    let lenghts = [Length.m.rawValue, Length.km.rawValue, Length.feet.rawValue, Length.yards.rawValue, Length.miles.rawValue]
    
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
        }
    }
}

#Preview {
    ContentView()
}
