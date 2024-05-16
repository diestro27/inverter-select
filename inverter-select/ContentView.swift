//
//  ContentView.swift
//  inverter-select
//
//  Created by Dexter Berend on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "";
  @State private var inverter = "15K-2P-N";
  
  let inverters = ["30K-3P-208V-N", "15K-2P-N", "12K-2P-N", "5K-1P-N"];
    
    var body: some View {
        VStack {
            Image("logo-official")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 100.0)
                .padding(.all, 16)
            Section {
                TextField("Name", text: $name)
                  .border(Color.orange)
                  .frame(maxWidth: .infinity)
                  .multilineTextAlignment(.center)
                  .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
              Picker("Inverter", selection: $inverter) {
                ForEach(inverters, id: \.self) {
                  Text($0)
                }
              }
            }
          
          Button(action: {
            print("Submit button tapped with name: \(name) and inverter: \(inverter).")
          }) {
            Text("Submit")
              .padding()
              .frame(maxWidth: .infinity)
              .foregroundColor(.white)
              .background(Color.blue)
              .cornerRadius(10)
          }
          .frame(width: 140)
          .padding(.top, 16)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
