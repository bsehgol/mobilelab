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
    let sounds = ["ishq",
    "talaash",
    "azadi"]
    
    // Player for sound clips.
    let audioPlayer = AVPlayer()
        
  // Play sound helper method.
     // Play sound helper method.
     func playSound(filename: String) {
         guard let url = Bundle.main.url(forResource: filename, withExtension: "MP3") else { return }
         
         let playerItem = AVPlayerItem(url: url)
         audioPlayer.replaceCurrentItem(with: playerItem)
         audioPlayer.play()
//         audioPlayer.pause()
     }
    
    // State variables for toggling animation.

    @State var imageAnimation = false
    
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
                    .onTapGesture {
                        self.audioPlayer.pause()
                    }
                
            }
            
            // Title and subtitle.
            VStack {
                VStack(alignment: .leading) {
                    Text("  Junoon")
                        .font(.custom("Helvetica-Light", size: 60))
                        .foregroundColor(Color.white)
                    
                    HStack {
                        Text("Ishq (Love), Azadi (Freedom)")
                            .font(.custom("Helvetica", size: 20))
                            .foregroundColor(.white)
                       
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
                        .opacity(imageAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            self.imageAnimation.toggle()
                            let sound = self.sounds[0]
                            self.playSound(filename: sound)
                        
                    }
                    
                    Image("talaash")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(imageAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            self.imageAnimation.toggle()
                            let sound = self.sounds[1]
                            self.playSound(filename: sound)
                    }
                    
                    Image("azadi")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(imageAnimation ? 0.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            self.imageAnimation.toggle()
                            let sound = self.sounds[2]
                            self.playSound(filename: sound)                            
                    }
                    
                    // Custom path drawing for equilateral triangle.
                    
                }
                .padding(.bottom, 40)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
               .onAppear() {
                   do {
                      // Override device mute control.
                      try AVAudioSession.sharedInstance().setCategory(.playback)
                   } catch(let error) {
                       print(error.localizedDescription)
                   }
               }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
