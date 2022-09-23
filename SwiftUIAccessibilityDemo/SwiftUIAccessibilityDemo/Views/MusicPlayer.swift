//
//  MusicPlayer.swift
//  SwiftUIAccessibilityDemo
//
//  Created by suni on 2022/09/22.
//

import SwiftUI
import AVKit
struct MusicPlayer: View {
    @State var audioPlayer: AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ZStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .padding()
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: Alignment.topLeading
            )
            VStack {
                Text("Play").font(.system(size: 45)).font(.largeTitle)
                HStack {
                    Spacer()
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        .navigationBarHidden(true)
    }
}
struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
