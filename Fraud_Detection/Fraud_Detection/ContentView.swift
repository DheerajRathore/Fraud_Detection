//
//  ContentView.swift
//  Fraud_Detection
//
//  Created by Dheeraj Rathore  on 21/07/24.
//

import SwiftUI

struct ContentView: View {
    
    private var contentVM = ContentViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
