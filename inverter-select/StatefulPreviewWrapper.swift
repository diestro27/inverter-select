//
//  StatefulPreviewWrapper.swift
//  inverter-select
//
//  Created by Dexter Berend on 5/17/24.
//

import SwiftUI

struct StatefulPreviewWrapper<T: Equatable, U: Equatable, Content: View>: View {
    @State private var value1: T
    @State private var value2: U
    
    let content: (Binding<T>, Binding<U>) -> Content

    init(_ initialValue1: T, _ initialValue2: U, @ViewBuilder content: @escaping (Binding<T>, Binding<U>) -> Content) {
        self._value1 = State(initialValue: initialValue1)
        self._value2 = State(initialValue: initialValue2)
        self.content = content
    }

    var body: some View {
        content($value1, $value2)
    }
}
