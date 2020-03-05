//
//  ContentView.swift
//  SignalKit
//  Created by Bilal Sehgol on 3/4/20.
//  Copyright © 2020 BilalSehgol. All rights reserved.
//

import SwiftUI

struct Signal {
    // Range: 0 - 10
    var intValue: Int
    // Range: 0 - 1.0
    var floatValue: Float
    // True or False
    var toggleValue: Bool
}


struct ContentView: View {
 
    @State var signal = Signal(intValue: 0, floatValue: 0, toggleValue: false)
    var body: some View {
        VStack {
            Controller(signal: $signal)
            Spacer()
            Visualizer(signal: $signal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
