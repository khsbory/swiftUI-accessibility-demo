//
//  CustomModalAccessibilityDemo.swift
//  SwiftUIAccessibilityDemo
//
//  Created by suni on 2022/10/22.
//

import SwiftUI

// MARK: 커스텀 모달 버전
struct CustomModalAccessibilityDemo: View {
    @State private var showModal = false
    @State private var isName = true
    @AccessibilityFocusState var isNameButtonFocused: Bool
    @AccessibilityFocusState var isIdButtonFocused: Bool
    
    var body: some View {
        ZStack {
            ModalAccessibilityCustomModal(showModal: self.$showModal, isName: self.$isName)
            VStack {
                HStack {
                    Text("성명").font(.system(size: 30))
                    Button(action: {
                        self.showModal(true)
                    }, label: {
                        Text("확인").font(.system(size: 30))
                    })
                }
                .accessibilityElement(children: .ignore)
                .accessibilityAddTraits(.isButton)
                .accessibilityLabel("성명 확인")
                .accessibilityAction {
                    self.showModal(true)
                }
                .accessibilityFocused($isNameButtonFocused)
                .padding(20)
                HStack {
                    Text("아이디").font(.system(size: 30))
                    Button(action: {
                        self.showModal(false)
                    }, label: {
                        Text("확인").font(.system(size: 30))
                    })
                }
                .accessibilityElement(children: .ignore)
                .accessibilityAddTraits(.isButton)
                .accessibilityLabel("아이디 확인")
                .accessibilityAction {
                    self.showModal(false)
                }
                .accessibilityFocused($isIdButtonFocused)
            }
            .navigationTitle("모달 접근성 데모")
            .onChange(of: self.showModal) { isShow in
                if !isShow {
                    if isName {
                        isNameButtonFocused = true
                    } else {
                        isIdButtonFocused = true
                    }
                }
            }
            .opacity(showModal ? 0 : 1)
        }
    }
    
    func showModal(_ isName: Bool) {
        self.isName = isName
        self.showModal = true
    }
}

struct MoCustomModalAccessibilityDemo_Previews: PreviewProvider {
    static var previews: some View {
        CustomModalAccessibilityDemo()
    }
}
