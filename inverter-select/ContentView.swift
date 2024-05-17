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
      NavigationView {
        FormView(name: $name, inverter: $inverter, inverters: inverters)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
