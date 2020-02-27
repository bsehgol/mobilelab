//
//  GameBoard.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct GameBoard: View {
    var avatarPosition: CGPoint
    var missilePosition:CGPoint
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blue.opacity(0.26)
                
                // Place collision objects.
                CollisionObject(position: CGPoint(x: 100, y: 200), avatarPosition: self.avatarPosition, missilePosition: self.missilePosition)

                CollisionObject(position: CGPoint(x: 300, y: 300), avatarPosition: self.avatarPosition, missilePosition: self.missilePosition)

                CollisionObject(position: CGPoint(x: 200    , y: 500), avatarPosition: self.avatarPosition, missilePosition: self.missilePosition)
                
                // Place avatar.
                Avatar(position: self.avatarPosition)
                
                Missile(position: self.missilePosition)
            }
            .border(Color.blue, width: 6.0)
        }
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            GameBoard(avatarPosition: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2), missilePosition: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
        }
    }
}
