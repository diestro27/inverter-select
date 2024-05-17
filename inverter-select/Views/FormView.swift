//
//  FormView.swift
//  inverter-select
//
//  Created by Dexter Berend on 5/17/24.
//

import SwiftUI

struct FormView: View {
  @Binding var name: String
  
  @Binding var inverter: String
  
  @State private var navigateToResults = false
  @State private var showError = false
  
  let inverters: [String]
  
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
              .onChange(of: name) { newValue in
                if !newValue.isEmpty {
                  showError = false
                }
              }
          Picker("Inverter", selection: $inverter) {
            ForEach(inverters, id: \.self) {
              Text($0)
            }
          }
        }
      NavigationLink(destination: ResultsView(name: name, inverter: inverter), isActive: $navigateToResults) {
        EmptyView()
      }
      
      Button(action: {
        if name.isEmpty {
          showError = true
          navigateToResults = false
        } else {
          showError = false
          navigateToResults = true
        }}) {
        Text("Submit")
          .padding()
          .frame(maxWidth: .infinity)
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(10)
      }
      .frame(width: 140)
      .padding(.top, 16)
      
      if showError {
        Text("Name is required")
          .foregroundColor(.red)
          .padding(.top, 10)
      }
    }
    .padding()
  }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        StatefulPreviewWrapper("John Buck", "15K-2P-N") { name, inverter in
            FormView(name: name, inverter: inverter, inverters: ["30K-3P-208V-N", "15K-2P-N", "12K-2P-N", "5K-1P-N"])
        }
      }
    }
}
