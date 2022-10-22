//
//  ModalAccessibilitySubView.swift
//  SwiftUIAccessibilityDemo
//
//  Created by suni on 2022/10/22.
//

import SwiftUI

struct ModalAccessibilitySubView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isName: Bool
    
    var body: some View {
        VStack {
            Text(self.isName ? "안녕하세요.\n이름은 김형섭입니다" : "안녕하세요.\n아이디는 khsbory입니다.")
                .padding(30)
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("닫기")
            }
        }
        .accessibilityAddTraits(.isModal)
            
    }
}

struct ModalAccessibilitySubView_Previews: PreviewProvider {
    static var previews: some View {
        ModalAccessibilitySubView(isName: .constant(true))
    }
}
