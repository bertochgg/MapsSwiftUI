//
//  Constants.swift
//  Map
//
//  Created by hgarcia on 21/08/23.
//

import SwiftUI

enum Constants {
    enum String {
        static let loginScreenTitle = "Please login to save \nlocations"
        static let enterNamePlaceholder = "Enter Name"
        static let passwordPlaceholder = "Password"
        static let loginButtonTitle = "Login"
    }

    enum FontSize {
        static let fontSize24: CGFloat = 24
    }

    enum Shadow {
        static let radius: CGFloat = 5
        static let xOffset: CGFloat = 0
        static let yOffset: CGFloat = 4
        static let opacity: Double = 0.25
    }

    enum Button {
        static let cornerRadius: CGFloat = 16
    }

    enum Colors {
        static let red = Color(red: 0.79, green: 0.11, blue: 0.11)
    }
}
