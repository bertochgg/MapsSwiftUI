//
//  ErrorMessageView.swift
//  Map
//
//  Created by hgarcia on 21/08/23.
//

import SwiftUI

struct ErrorMessage: View {
    let errorMessage: String
    var body: some View {

        Text(errorMessage)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Constants.Colors.red)
            .padding(.bottom, 8)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
    }
}

struct ErrorMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessage(errorMessage: "Wrong Password, try again.")
    }
}
