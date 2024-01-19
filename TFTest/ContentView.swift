//
//  ContentView.swift
//  TFTest
//
//  Created by Paul Wilkinson on 16/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "";

    var body: some View {
        VStack {
            Text("Hello, world!")

            TextField("Tap me", text: $text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .keyboardType(.numberPad)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
