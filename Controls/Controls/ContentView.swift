//
//  ContentView.swift
//  Controls
//
//  Created by Olesia Nurislamova on 30.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isShowing = true
    @State private var value = 1
    @State private var size: CGFloat = 0.1
    
    @State var selectedDate = Date()
        var dateClosedRange: ClosedRange<Date> {
            let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            return min...max
        }
    
    var body: some View {
        
            VStack {
                
                Button(role: .destructive) {
                    print("do something!")
                } label: {
                    HStack {
                        Image(systemName:  "trash")
                        Text("button")
                    }
                }
                
                Toggle(isOn: $isShowing) {
                    Text("Toggle")
                }
                
                NavigationView {
                    
                    VStack {
                        Text("Current value: \(value)")
                        Stepper("Number of guests", value: $value, in:1...20)
                    }
                    .padding()
                    .navigationTitle("Steppers")
                }
                
                Text("Sliders").font(.system(size: size * 100))
                Slider(value: $size)
                
                NavigationView {
                    Form {
                        Section {
                            DatePicker(
                                selection: $selectedDate,
                                in: dateClosedRange,
                                displayedComponents: .date,
                                label: { Text("Date Picker") }
                            )
                            
                        }
                        
                    }
                    
                }
                Label("Menu", systemImage: "heart")
                            .labelStyle(.titleAndIcon)
                
                
            }
            .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
