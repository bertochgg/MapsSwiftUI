//
//  String+ValidUsername.swift
//  Map
//
//  Created by hgarcia on 21/08/23.
//

import Foundation

extension String {
    func isValidUsername() -> Bool {
        let regex = "^[a-zA-Z0-9]*$"
        return range(of: regex, options: .regularExpression) != nil
    }
}
