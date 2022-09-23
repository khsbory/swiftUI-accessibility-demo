//
//  MusicPlayer.swift
//  SwiftUIAccessibilityDemo
//
//  Created by suni on 2022/09/22.
//

import SwiftUI


struct MusicPlayer: View {
    var body: some View {
        Text("뮤직플레이어")
        .navigationBarHidden(true)
    }
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
