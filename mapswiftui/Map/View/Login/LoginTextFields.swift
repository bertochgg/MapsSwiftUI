//
//  LoginTextFields.swift
//  Map
//
//  Created by hgarcia on 21/08/23.
//

import SwiftUI

struct LoginTextField: View {
    @Binding var text: String
    let placeholder: String
    let isSecure: Bool
    let errorMessage: String

    var body: some View {
        ZStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .frame(height: 41)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.horizontal, 13)
                    .applyShadow()
                    .padding(.horizontal, 23)
                    .font(.system(size: 16, weight: .semibold))
            } else {
                TextField(placeholder, text: $text)
                    .frame(height: 41)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.horizontal, 13)
                    .applyShadow()
                    .padding(.horizontal, 23)
                    .font(.system(size: 16, weight: .semibold))
                    .onChange(of: text) { newValue in
                        text = newValue.lowercased()
                    }
            }
        }
        .padding(.bottom, 19)
    }
}
