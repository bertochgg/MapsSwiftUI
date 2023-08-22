//
//  View+Shadow.swift
//  Map
//
//  Created by hgarcia on 21/08/23.
//

import SwiftUI

extension View {
    func applyShadow() -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(Constants.Shadow.opacity),
                            radius: Constants.Shadow.radius,
                            x: Constants.Shadow.xOffset,
                            y: Constants.Shadow.yOffset)
                    .offset(x: 0, y: 0)
            )
    }
}


