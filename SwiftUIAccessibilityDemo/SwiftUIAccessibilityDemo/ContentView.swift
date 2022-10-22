//
//  ContentView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by suni on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MusicPlayer()) {
                    Text("뮤직 플레이어")
                }
                NavigationLink(destination: ModalAccessibilityDemo()) {
                    Text("모달 접근성 데모")
                }
            }
            .navigationBarTitle(Text("SwiftUI Accessibility Demo"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
