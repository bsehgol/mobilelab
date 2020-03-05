//
//  Controller.swift
//  SignalKit
//  Created by Bilal Sehgol on 3/4/20.
//  Copyright © 2020 BilalSehgol. All rights reserved.
//

import SwiftUI

struct Visualizer: View {
    // Binding variable.
    @Binding var signal: Signal

    var body: some View {

        VStack{
            
                  Circle()
                        .fill(Color.red)
                        .blur(radius: CGFloat(signal.floatValue), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal.floatValue)))

                    Circle()
                        .fill(Color.yellow)
                        .blur(radius: CGFloat(signal.floatValue), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal.floatValue)))
            
                        
                    Circle()
                       .fill(Color.green)
                        .blur(radius: CGFloat(signal.floatValue), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal.floatValue)))

        }
            
    }
}

struct Visualizer_Previews: PreviewProvider {
    static var previews: some View {
        Visualizer(signal: .constant(Signal(intValue: 0, floatValue: 0.0, toggleValue: false)))

    }
}
