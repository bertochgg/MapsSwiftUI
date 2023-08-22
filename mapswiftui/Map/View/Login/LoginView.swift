//
//  LoginView.swift
//  Map
//
//  Created by hgarcia on 01/08/23.
//

import SwiftUI

struct LoginView: View {
    @State private var isPasswordVisible: Bool = false
    @State private var isActive: Bool = false
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(Constants.String.loginScreenTitle)
                    .font(.system(size: Constants.FontSize.fontSize24, weight: .semibold))
                    .padding(.bottom, 21)
                    .padding(.leading, 19)

                LoginTextField(text: $viewModel.getUsername,
                               placeholder: Constants.String.enterNamePlaceholder,
                               isSecure: false,
                               errorMessage: viewModel.getUsernameError)

                LoginTextField(text: $viewModel.getPassword,
                               placeholder: Constants.String.passwordPlaceholder,
                               isSecure: !isPasswordVisible,
                               errorMessage: viewModel.getPasswordError)
                .overlay(
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }
                        .padding(.trailing, 40),
                    alignment: .trailingFirstTextBaseline
                )

                VStack {
                    if !viewModel.isUsernameErrorEmpty
                        || !viewModel.isPasswordErrorEmpty {
                        ErrorMessage(errorMessage: viewModel.isUsernameErrorEmpty ? viewModel.getPasswordError : viewModel.getUsernameError)
                    }

                    Button(action: login) {
                        Text(Constants.String.loginButtonTitle)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .padding(.top, 16)
                            .padding(.bottom, 16)
                            .background(Constants.Colors.red)
                            .cornerRadius(16)
                    }
                    .background(
                        NavigationLink(
                            destination: MainView(),
                            isActive: $isActive,
                            label: EmptyView.init
                        )
                        .opacity(0)
                    )
                    .padding(.leading, 16)
                    .padding(.trailing, 23)

                    Spacer()
                }
            }
            .padding(.top, 53)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getIsActiveBinding = $isActive
        }
    }
}

// MARK: - Private Methods
private extension LoginView {
    func login() {
        viewModel.login()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
