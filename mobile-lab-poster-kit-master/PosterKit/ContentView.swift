//
//  ContentView.swift
//  PosterKit
//
//  Created by Nien Lam on 2/6/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // State variables for toggling animation.
    @State var circleAnimation = false
    @State var squareAnimation = false
    @State var triangleAnimation = false
    @State var moonAnimation = false
    
    var body: some View {
        ZStack {
            // Background color.
            Color(red: 0, green: 0, blue: 0)
            
            // Moon and Earth images.
            VStack {
                HStack {
                    Spacer()
                    
                    Image("moon")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(moonAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            self.moonAnimation.toggle()
                    }
                }
                .padding(.trailing, 40)
                
                Image("earth-night")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            // Title and subtitle.
            VStack {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.custom("Helvetica-Light", size: 80))
                        .foregroundColor(Color.white)
                    
                    HStack {
                        Text("Subtitle")
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 50)
            
            // Shapes.
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 80, height: 80)
                        .scaleEffect(circleAnimation ? 1.5 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .onTapGesture {
                            self.circleAnimation.toggle()
                    }
                    
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 80, height: 80)
                        .rotationEffect(squareAnimation ? .degrees(315) : .degrees(0))
                        .animation(Animation.easeInOut(duration: 1.0))
                        .onTapGesture {
                            self.squareAnimation.toggle()
                    }
                    
                    // Custom path drawing for equilateral triangle.
                    Path { path in
                        path.move(to: CGPoint(x: 46.2, y: 0))
                        path.addLine(to: CGPoint(x: 92.4, y: 80))
                        path.addLine(to: CGPoint(x: 0, y: 80))
                    }
                    .offset(x: 0, y: -12.4)
                    .fill(Color.blue)
                    .frame(width: 92.4, height: 80)
                    .offset(x: 0, y:  triangleAnimation ? -300 : 12.4)
                    .animation(Animation.easeInOut(duration: 1.0))
                    .onTapGesture {
                        self.triangleAnimation.toggle()
                    }
                }
                .padding(.bottom, 80)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
