//
//  LocationErrorView.swift
//  Map
//
//  Created by hgarcia on 28/07/23.
//

import SwiftUI

private enum ConstantsForErrorView {
    enum String {
        static let accessLocationErrorTitle = "Cannot access your \nlocation"
        static let accessLocationErrorDescription = "Please accept location request or \nenable location updates in settings"
    }

    enum Integers {
        static let fontSize24: CGFloat = 24
        static let fontSize12: CGFloat = 12

        static let spacing24: CGFloat = 24
        static let paddingTop189: CGFloat = 189
    }

    enum Colors {
        static let gray = Color(red: 0.62, green: 0.62, blue: 0.62)
    }
}

struct LocationErrorView: View {
    var body: some View {
        VStack(spacing: ConstantsForErrorView.Integers.spacing24) {

            ReusableTextField(title: ConstantsForErrorView.String.accessLocationErrorTitle,
                              fontWeight: .semibold,
                              fontColor: .black,
                              fontSize: ConstantsForErrorView.Integers.fontSize24)
            ReusableTextField(title: ConstantsForErrorView.String.accessLocationErrorDescription,
                              fontWeight: .regular,
                              fontColor: ConstantsForErrorView.Colors.gray,
                              fontSize: ConstantsForErrorView.Integers.fontSize12)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top, ConstantsForErrorView.Integers.paddingTop189)
    }
}

struct ReusableTextField: View {
    let title: String
    let fontWeight: Font.Weight
    let fontColor: Color
    let fontSize: CGFloat
    var body: some View {
        Text(title)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor(fontColor)

    }
}

struct LocationErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LocationErrorView()
    }
}
