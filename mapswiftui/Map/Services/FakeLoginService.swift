//
//  FakeLoginService.swift
//  Map
//
//  Created by hgarcia on 21/08/23.
//

import Foundation

class LoginService {
    static let shared = LoginService()

    private let usernameKey = "username"
    private let passwordKey = "password"

    private init() {}

    func login(username: String, password: String) -> Bool {
        let savedUsername = UserDefaults.standard.string(forKey: usernameKey)
        let savedPassword = UserDefaults.standard.string(forKey: passwordKey)

        if username == savedUsername && password == savedPassword {
            return true
        }

        return false
    }

    func saveCredentials(username: String, password: String) {
        UserDefaults.standard.set(username, forKey: usernameKey)
        UserDefaults.standard.set(password, forKey: passwordKey)
    }

    func clearCredentials() {
        UserDefaults.standard.removeObject(forKey: usernameKey)
        UserDefaults.standard.removeObject(forKey: passwordKey)
    }
}
