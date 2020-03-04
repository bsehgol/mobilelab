//
//  Controller.swift
//  SignalKit
//  Created by Bilal Sehgol on 3/4/20.
//  Copyright © 2020 BilalSehgol. All rights reserved.
//

import SwiftUI

struct Visualizer: View {
    // Binding variable.
    @Binding var signal: Double

    var body: some View {

        VStack{
            
                    Circle()
                        .fill(Color.red)
                        .blur(radius: CGFloat(signal), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal)))

                    Circle()
                        .fill(Color.yellow)
                        .blur(radius: CGFloat(signal+30), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal/3600)))
                        
                    Circle()
                       .fill(Color.green)
                        .blur(radius: CGFloat(signal+60), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal/21600)))

        }
            
    }
}

struct Visualizer_Previews: PreviewProvider {
    static var previews: some View {
      Visualizer(signal: .constant(80))

    }
}
