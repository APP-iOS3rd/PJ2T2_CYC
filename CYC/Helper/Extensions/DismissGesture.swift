//
//  DismissGesture.swift
//  CYC
//
//  Created by 황민채 on 12/13/23.
//

import SwiftUI

extension View {
    func DismissGesture() -> some View {
        modifier(CustomViewDismissGesture())
    }
}

struct CustomViewDismissGesture: ViewModifier {
    @State private var translation: CGSize = .zero
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded {_ in
                        withAnimation(.spring()) {
                            let dragOffset = translation.width
                            print(dragOffset)
                            if dragOffset > 100 {
                                dismiss()
                            }
                            translation = .zero
                        }
                    }
            )
    }
}
