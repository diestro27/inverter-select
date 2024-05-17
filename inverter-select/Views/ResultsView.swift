//
//  ResultsView.swift
//  inverter-select
//
//  Created by Dexter Berend on 5/17/24.
//

import SwiftUI

struct ResultsView: View {
  let name: String
  let inverter: String
  
    var body: some View {
      VStack {
        Text("Name: \(name)")
          .font(.title)
          .padding()
        
        Text("Inverter: \(inverter)")
          .font(.title)
          .padding()
        
        Spacer();
      }
      .navigationTitle("Results")
      .padding()
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
      ResultsView(name: "Steve Wozniak", inverter: "15K-2P-N")
    }
}
