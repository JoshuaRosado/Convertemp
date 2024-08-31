//
//  ContentView.swift
//  Convertemp
//
//  Created by Joshua Rosado Olivencia on 8/31/24.
//


import SwiftUI

struct ContentView: View {
    @State private var degreeDigit = 0
    @State private var selectedTemperature = "Farenheit"
    @State private var convertToTemperature = "Celsius"
    @FocusState private var digitIsFocus : Bool
    
    let temperatureTypes = ["Farenheit", "Celsius", "Kelvin"]
    
    var convertionResult: Int {
        if selectedTemperature == "Farenheit" && convertToTemperature == "Celsius"{
            let fToC = (degreeDigit - 32) * 5 / 9
            return fToC
            
        }
        else if selectedTemperature == "Farenheit" && convertToTemperature == "Kelvin"{
            let fToK = (Double(degreeDigit) - 32) * 5 / 9 + 273.15
            return Int(fToK)
            
        }
        else if selectedTemperature == "Celsius" && convertToTemperature == " Farenheit"{
            let cToF = (degreeDigit * 9 / 5) + 32
            return cToF
        }
        else if selectedTemperature == "Celsius" && convertToTemperature == "Kelvin"{
            let cToK = Double(degreeDigit) + 273.15
            return Int(cToK)
        }
        
        else if selectedTemperature == "Kelvin" && convertToTemperature == "Farenheit"{
            let kToF = (Double(degreeDigit) - 273.15) * 9 / 5 + 32
            return Int(kToF)
        }
        else if selectedTemperature == "Kelvin" && convertToTemperature == "Celsius" {
            let kToC = (Double(degreeDigit) - 273.15)
            return Int(kToC)
        }
        else{
            return 0
        }
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Degree digit"){
                    HStack{
                        TextField("Degree digit", value: $degreeDigit, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($digitIsFocus)
                        
                        Picker("", selection: $selectedTemperature){
                            ForEach(temperatureTypes, id: \.self){
                                Text($0)
                            }
                            .pickerStyle(.menu)
                        }
                        
                    }
                }
                Section("Convertion result"){
                    HStack{
                        
                        Text(convertionResult, format: .number)
                        Picker("", selection: $convertToTemperature){
                            ForEach(temperatureTypes, id: \.self){
                                Text($0)
                            }
                        }
                    }
                }
            }
            .navigationTitle("ConvertingTemp")
            .toolbar {
                if digitIsFocus{
                    Button("Done"){
                        digitIsFocus = false
                    }
                }
            }
        }
        
        
    }
        }
        
        #Preview {
            ContentView()
        }
