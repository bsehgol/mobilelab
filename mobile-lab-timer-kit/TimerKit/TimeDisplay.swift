//
//  TimeDisplay.swift
//  TimerKit
//
//  Created by Nien Lam on 2/13/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct TimeDisplay: View {
    // Binding variable.
    @Binding var timeRemaining: Double

    var body: some View {

        VStack{
            
  
                Circle()
                        .fill(Color.red)
                        .blur(radius: CGFloat(timeRemaining), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*timeRemaining)))

                    Circle()
                        .fill(Color.yellow)
                        .blur(radius: CGFloat(timeRemaining*1.2), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*timeRemaining*1.2)))
                        
                    Circle()
                       .fill(Color.green)
                        .blur(radius: CGFloat(timeRemaining*1.6), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*timeRemaining*1.6)))
            

        }
            
    }
}

struct TimeDisplay_Previews: PreviewProvider {
    static var previews: some View {
      TimeDisplay(timeRemaining: .constant(80))

    }
}
