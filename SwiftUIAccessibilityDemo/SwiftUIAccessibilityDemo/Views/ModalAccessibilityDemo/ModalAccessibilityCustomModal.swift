//
//  ModalAccessibilityCustomModal.swift
//  SwiftUIAccessibilityDemo
//
//  Created by suni on 2022/10/22.
//

import SwiftUI

struct ModalAccessibilityCustomModal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var showModal: Bool
    @Binding var isName: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text(self.isName ? "안녕하세요.\n이름은 김형섭입니다" : "안녕하세요.\n아이디는 khsbory입니다.")
                    .padding(30)
                Button {
                    self.showModal = false
                } label: {
                    Text("닫기")
                }
            }
        }
        .opacity(showModal ? 1 : 0)
        .onChange(of: self.showModal) { isShow in
            if isShow {
                _ = self.accessibilityAddTraits(.isModal)
            } else {
                _ = self.accessibilityRemoveTraits(.isModal)
            }
        }
    }
}

struct ModalAccessibilityCustomModal_Previews: PreviewProvider {
    static var previews: some View {
        ModalAccessibilityCustomModal(showModal: .constant(true),isName: .constant(true))
    }
}
