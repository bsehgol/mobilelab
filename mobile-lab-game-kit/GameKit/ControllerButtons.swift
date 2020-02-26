//
//  Controller.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct ControllerButtons: View {
    @Binding var avatarPosition: CGPoint

    var body: some View {
        HStack {
            Button(action: {
                self.avatarPosition.y -= 20
            }) {
                Text("Up")
                    .font(.system(size: 14))
                    .frame(width: 60, height: 44)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }

            Button(action: {
                self.avatarPosition.y += 20
            }) {
                Text("Down")
                    .font(.system(size: 14))
                    .frame(width: 60, height: 44)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }

            Button(action: {
                self.avatarPosition.x -= 20
            }) {
                Text("Left")
                    .font(.system(size: 14))
                    .frame(width: 60, height: 44)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }

            Button(action: {
                self.avatarPosition.x += 20
            }) {
                Text("Right")
                    .font(.system(size: 14))
                    .frame(width: 60, height: 44)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }
        }
        .padding()
        .border(Color.black, width: 3)
    }
}

struct ControllerButtons_Previews: PreviewProvider {
    static var previews: some View {
        ControllerButtons(avatarPosition: .constant(CGPoint(x: 0, y: 0)))
    }
}
