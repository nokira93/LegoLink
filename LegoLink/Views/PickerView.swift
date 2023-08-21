//
//  PickerView.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 20/08/2023.
//

import SwiftUI

struct PickerView: View {
    @State private var number = 0
    
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $number) {
                Text("25").tag(0)
                Text("50").tag(1)
                Text("100").tag(2)
                Text("150").tag(2)
            }
            .pickerStyle(.segmented)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
