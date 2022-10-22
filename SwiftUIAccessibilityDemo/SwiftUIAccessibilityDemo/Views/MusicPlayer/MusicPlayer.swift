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
            let url = Bundle.main.url(forResource: "song", withExtension: "mp3")!
            do {
                try self.audioPlayer = AVAudioPlayer(contentsOf: url)
            } catch {
                   fatalError()
            }
        }
        .navigationBarHidden(true)
        .accessibilityAction(.magicTap) { // 접근성 적용 - 재생/정지
            if self.audioPlayer.isPlaying {
                self.audioPlayer.pause()
            } else {
                self.audioPlayer.play()
            }
        }
        .accessibilityAction(.escape) { // 접근성 적용 - 뒤로 가기
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
