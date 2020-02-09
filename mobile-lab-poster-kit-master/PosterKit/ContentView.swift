//
//  ContentView.swift
//  PosterKit
//
//  Created by Nien Lam on 2/6/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    
    // Player for sound clips.
    let audioPlayer = AVPlayer()
    
    let sounds = ["azadi",
                  "talaash",
                  "ishq"]
    
    // Play sound helper method.
    func playSound(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "") else { return }
        
        let playerItem = AVPlayerItem(url: url)
        audioPlayer.replaceCurrentItem(with: playerItem)
        audioPlayer.play()
    }
    
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
                    
                }
                .padding(.trailing, 20)
                
                Image("deewarCover")
                    .resizable()
                    .frame(width: 320, height: 550)
                    .aspectRatio(contentMode: .fit)
                
            }
            
            // Title and subtitle.
            VStack {
                VStack(alignment: .leading) {
                    Text("Junoon")
                        .font(.custom("Helvetica-Light", size: 80))
                        .foregroundColor(Color.white)
                    
                    HStack {
                        Text("Top Songs")
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
                    Image("ishq")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(moonAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                           let sound = self.sounds[0]
                            self.playSound(filename: sound)
                    }
                    
                    Image("talaash")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(moonAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            let sound = self.sounds[1]
                            self.playSound(filename: sound)
                    }
                    
                    Image("azadi")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(moonAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            let sound = self.sounds[0]
                            self.playSound(filename: sound)
                            
                    }
                    
                    // Custom path drawing for equilateral triangle.
                    
                }
                .padding(.bottom, 40)
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
