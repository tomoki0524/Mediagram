//
//  ButtonModifiers.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/09/30.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold))
            .background(Color.black)
            .cornerRadius(5.0)
    }
}

