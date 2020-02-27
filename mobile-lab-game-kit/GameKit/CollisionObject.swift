//
//  CollisionObject.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct CollisionObject: View {
    var position: CGPoint
    var avatarPosition: CGPoint
    var missilePosition: CGPoint
    
    let size: CGFloat = 80
    
    // Logic to check if avatar is inside the collision object.
    func isAvatarInside() -> Bool {
        if (position.x - size / 2.0) < avatarPosition.x && avatarPosition.x < (position.x + size / 2.0) &&
            (position.y - size / 2.0) < avatarPosition.y && avatarPosition.y < (position.y + size / 2.0) {
                return true
            } else if (position.x - size / 2.0) < missilePosition.x && missilePosition.x < (position.x + size / 2.0) &&
            (position.y - size / 2.0) < missilePosition.y && missilePosition.y < (position.y + size / 2.0) {
                return true
            }else {
                    return false
                }
        }
        
        var body: some View {
            ZStack {
                Color.red
                    .frame(width: size, height: size)
                    .opacity(isAvatarInside() ? 0.25 : 1.0)
            }
            .border(Color.purple, width: 2)
            .position(position)
        }
    }
    
    struct CollisionObject_Previews: PreviewProvider {
        static var previews: some View {
            GeometryReader { geometry in
                CollisionObject(position: CGPoint(x: geometry.size.width / 2, y:  geometry.size.height / 2), avatarPosition: CGPoint(x: 0, y: 0), missilePosition: CGPoint(x: 0, y: 0))
            }
        }
}