//
//  Avatar.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct Missile: View {
    var position: CGPoint
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.black)
                .frame(width: 100.0, height: 10.0)
        }
        .frame(width: 50, height: 50)
        .position(position)
        .animation(.easeInOut(duration: 0.2))
        
    }
    
}

struct Missile_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Missile(position: CGPoint(x: geometry.size.width / 2, y:  geometry.size.height / 2))
        }
    }
}
