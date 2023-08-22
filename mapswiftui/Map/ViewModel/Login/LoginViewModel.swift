//
//  LoginViewModel.swift
//  Map
//
//  Created by hgarcia on 09/08/23.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published private var username = ""
    @Published private var password = ""
    @Published private var usernameError = ""
    @Published private var passwordError = ""
    @Published private var isActiveBinding: Binding<Bool> = .constant(false)

    var isUsernameErrorEmpty: Bool {
        return usernameError.isEmpty
    }

    var isPasswordErrorEmpty: Bool {
        return passwordError.isEmpty
    }

    var getIsActiveBinding: Binding<Bool> {
        get { return isActiveBinding }
        set { isActiveBinding = newValue }
    }

    var getUsername: String {
        get { return username }
        set { username = newValue }
    }

    var getPassword: String {
        get { return password }
        set { password = newValue }
    }

    var getUsernameError: String {
        return usernameError
    }

    var getPasswordError: String {
        return passwordError
    }

    func login() {
        validateUsername()
        validatePassword()

        if usernameError.isEmpty && passwordError.isEmpty {
            LoginService.shared.saveCredentials(username: username, password: password) // Uncomment in order to save username and password
            if LoginService.shared.login(username: username, password: password) {
                print("Logged in successfully!")
                isActiveBinding.wrappedValue = true
            } else {
                print("Login failed")
            }
        }
    }

    private func validateUsername() {
        if username.isEmpty {
            usernameError = "Username cannot be empty"
        } else if !username.isValidUsername() {
            usernameError = "Username can only contain letters and numbers"
        } else {
            usernameError = ""
        }
    }

    private func validatePassword() {
        if password.isEmpty {
            passwordError = "Password cannot be empty"
        } else if password.count < 6 {
            passwordError = "Password must be at least 6 characters"
        } else {
            passwordError = ""
        }
    }

}
